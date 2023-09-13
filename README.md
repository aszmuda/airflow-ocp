## Airflow

This folder contains a helm chart for running Apache Airflow on OpenShift. The chart was inspired by the [Helm Chart for Apache Airflow](https://github.com/apache/airflow/tree/main/chart).

For Airflow components, [this](https://github.com/aszmuda/mds-supply-chain/tree/main/airflow) repository was used to build the image.

For embedded PostgreSQL and Redis containers, the deployment was tested using the following Red Hat maintained images:
* [rhel9/postgresql-15](https://catalog.redhat.com/software/containers/rhel9/postgresql-15/63f763f779eb1214c4d6fcf6)
* [rhel9/redis-6](https://catalog.redhat.com/software/containers/rhel9/redis-6/61c189dfc6d6ba37322fd5c7)

### Deployment prerequisites:
* OpenShift environment (e.g. [OpenShift Local](https://access.redhat.com/documentation/en-us/red_hat_openshift_local))
* [**helm**](https://helm.sh/) and [**oc**](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.13/html/cli_tools/openshift-cli-oc) cli tools
* DAG repository - a git (e.g. GitHub) repository for storing your Airflow dags. For the sake of simplicity make the repo public so that the git-sync container can pull without authentication.
* _(Optional)_ Access to PostgreSQL if you want to use an external database instead of the embedded.
* _(Optional)_ Access to an external Redis cluster if embedded one is not sufficient.
* _(Optional)_ Access to Keycloak for OAuth Authentication and Authorization.

> The installation and configuration of the above prerequisites are outside of scope of this document.

### 1. Create project
Login to OpenShift and create a new project for the Airflow deployment. For example:

`oc new-project airflow`

### 2. Clone repository
Clone this repository with the helm chart and `cd` into the `airflow` directory

### 3. Prepare values.yaml
Open the `values.yaml` file under the `airflow` directory and set the properties according to your needs.

> You can leverage the included sample file, celery-values.yaml and k8s-values.yaml, respectively
> * **celery-values.yaml** - deploys Airflow with the CeleryExecutor (installs one Airflow worker and a single node Redis cluster)
> * **k8s-values.yaml** - deploys Airflow with the KubernetesExecutor (ephemeral Airflow workers and no Redis)
> 
> both samples will configure an embedded PostreSQL DB for Airflow, git-sync containers for dag synchronisation, and persistence storage for logs

### 4. Deploy
Once you have the `values.yaml` file set, you can validate the templates as follows:

> **NOTE:** Make sure you are running the command from the `airflow` chart directory and don't forget to replace `{{ release }}` with the actual name of the release. i.e. `airflow-dev`
> 
```bash
helm template --release-name {{ release }} -f values.yamal . 
```


If the generated resources look as expected, you can deploy them to OpenShift using the following command:

```bash
helm template --release-name {{ release }} -f values-yaml . | oc apply -f-
```

> **NOTE:** It might take a few minutes until OpenShift pulls all the images and pods start running.
> You can check the status with: `oc get pods -w`


## _Optional steps_
### 1. Create Airflow Database and User
When using an external PostgreSQL database, you will need to create the airflow user and database using DB admin account. For example:
```sql
CREATE USER airflow WITH PASSWORD 'password';
CREATE DATABASE airflow WITH OWNER airflow;
```
> **NOTE:** When Airflow first time connects to the database, it will initialise all necessary tables.


### 2. Keycloak config

#### Keycloak client
1. Create a Keycloak client for Airflow (e.g. `airflow`) in the selected realm.
2. The client should have the **"Client Authentication"** capability set.
3. **Valid redirect URI** and **Web origins** settings should be set to **"*"** on the client.
4. Add the **["Admin","Op","User","Viewer","Public"]** roles to the client.
5. Under **Client Scopes >> airflow-dedicated** add the "client role" mapper from the list of predefined mappers. Ensure that the claim is added to the **user info**.

#### Keycloak users
1. Map Airflow users in Keycloak to relevant airflow client roles so that users can login.

#### Keycloak chart config
1. Enable and fill out Keycloak relevant properties in `values.yaml`
2. The `clientId` and `clientSecret` should have the same values as configured in Keycloak above.
```bash
## airflow config if keycloak is used for OIDC authentication
## keycloak installation and configuration is out of chart scope
keycloak:
  enabled: true
  oidcIssuer: # e.g. https://<keycloak host>:8443/realms/airflow
  clientId: # e.g. airflow
  clientSecret: # some has value
````

> **NOTE:** You can keep sensitive values empty in `values.yaml` and instead of that pass the values with the helm command. For example:
```bash
helm template --release-name airflow-dev --set keycloak.clientSecret={{replace me}} -f values.yaml . | oc apply -f- 
```