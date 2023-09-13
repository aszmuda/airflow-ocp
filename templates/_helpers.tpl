{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default "airflow" .Values.airflow.scheduler.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "webserver.name" -}}
{{- default "webserver" .Values.airflow.webserver.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "scheduler.name" -}}
{{- default "scheduler" .Values.airflow.scheduler.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "worker.name" -}}
{{- default "worker" .Values.airflow.worker.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "triggerer.name" -}}
{{- default "triggerer" .Values.airflow.triggerer.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgresql.name" -}}
{{- default "postgresql" .Values.postgresql.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "redis.name" -}}
{{- default "redis" .Values.postgresql.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "db-migration.name" -}}
{{- default "db-migration" .Values.airflow.migrateDatabaseJob.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "create-user.name" -}}
{{- default "create-user" .Values.airflow.createUserJob.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webserver.fullname" -}}
{{- if .Values.airflow.webserver.fullnameOverride }}
{{- .Values.airflow.webserver.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "webserver" ) .Values.airflow.webserver.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "scheduler.fullname" -}}
{{- if .Values.airflow.scheduler.fullnameOverride }}
{{- .Values.airflow.scheduler.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "scheduler" ) .Values.airflow.scheduler.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "worker.fullname" -}}
{{- if .Values.airflow.worker.fullnameOverride }}
{{- .Values.airflow.worker.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "worker" ) .Values.airflow.worker.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "triggerer.fullname" -}}
{{- if .Values.airflow.triggerer.fullnameOverride }}
{{- .Values.airflow.triggerer.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "triggerer" ) .Values.airflow.triggerer.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride }}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "postgresql" ) .Values.postgresql.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "redis.fullname" -}}
{{- if .Values.redis.fullnameOverride }}
{{- .Values.redis.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "redis" ) .Values.redis.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "db-migration.fullname" -}}
{{- if .Values.airflow.migrateDatabaseJob.fullnameOverride }}
{{- .Values.airflow.migrateDatabaseJob.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "db-migration" ) .Values.airflow.migrateDatabaseJob.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "create-user.fullname" -}}
{{- if .Values.airflow.createUserJob.fullnameOverride }}
{{- .Values.airflow.createUserJob.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s-%s" ( include "app.name" . ) "create-user" ) .Values.airflow.createUserJob.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "airflow.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "airflow.labels" -}}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "webserver.labels" -}}
{{ include "webserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "scheduler.labels" -}}
{{ include "scheduler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "worker.labels" -}}
{{ include "worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "triggerer.labels" -}}
{{ include "triggerer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "postgresql.labels" -}}
{{ include "postgresql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "redis.labels" -}}
{{ include "redis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "db-migration.labels" -}}
{{ include "db-migration.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}

{{- define "create-user.labels" -}}
{{ include "create-user.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "airflow.chart" . }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "webserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "webserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "scheduler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "scheduler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "triggerer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "triggerer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "postgresql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "redis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: {{ include "redis.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "db-migration.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: db-migration
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "create-user.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/component: create-user
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Service accounts
*/}}
{{- define "airflow.serviceAccountName" -}}
    {{- $name := include "app.name" . }}
    {{- if contains $name .Release.Name }}
        {{- .Release.Name | trunc 63 | trimSuffix "-" }}
    {{- else }}
        {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
    {{- end }}
{{- end }}


{{/*
Helper commands
*/}}
{{- define "wait-for-migrations-command"}}
  - airflow
  - db
  - check-migrations
  - --migration-wait-timeout={{ .Values.airflow.webserver.waitForMigrations.migrationsWaitTimeout }}
{{- end }}

{{- define "scheduler_liveness_check_command" }}
  - sh
  - -c
  - |
    CONNECTION_CHECK_MAX_COUNT=0 AIRFLOW__LOGGING__LOGGING_LEVEL=ERROR exec $AIRFLOW_HOME/bin/entrypoint.sh \
    airflow jobs check --job-type SchedulerJob --local
{{- end }}

{{- define "worker_liveness_check_command" }}
    - "python"
    - "-Wignore"
    - "-c"
    - |
      import os
      import sys
      import subprocess
      from celery import Celery
      from celery.app.control import Inspect
      from typing import List

      def run_command(cmd: List[str]) -> str:
          process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
          output, error = process.communicate()
          if error is not None:
              raise Exception(error)
          else:
              return output.decode(encoding="utf-8")

      broker_url = run_command(["bash", "-c", "echo $AIRFLOW__CELERY__BROKER_URL"])
      local_celery_host = f"celery@{os.environ['HOSTNAME']}"
      app = Celery(broker=broker_url)

      # ping the local celery worker to see if it's ok
      i = Inspect(app=app, destination=[local_celery_host], timeout=5.0)
      ping_responses = i.ping()
      if local_celery_host not in ping_responses:
          sys.exit(f"celery worker '{local_celery_host}' did not respond to ping")
{{- end }}

{{- define "triggerer_liveness_check_command" }}
    - "python"
    - "-Wignore"
    - "-c"
    - |
      import os
      import sys

      # suppress logs triggered from importing airflow packages
      os.environ["AIRFLOW__LOGGING__LOGGING_LEVEL"] = "ERROR"

      # shared imports
      try:
          from airflow.jobs.job import Job
      except ImportError:
          # `BaseJob` was renamed to `Job` in airflow 2.6.0
          from airflow.jobs.base_job import BaseJob as Job
      from airflow.utils.db import create_session
      from airflow.utils.net import get_hostname

      # heartbeat check imports
      try:
          from airflow.jobs.triggerer_job_runner import TriggererJobRunner
      except ImportError:
          # `TriggererJob` is wrapped by `TriggererJobRunner` since airflow 2.6.0
          from airflow.jobs.triggerer_job import TriggererJob as TriggererJobRunner

      with create_session() as session:
          # ensure the TriggererJob with most recent heartbeat for this `hostname` is alive
          hostname = get_hostname()
          triggerer_job = session \
              .query(Job) \
              .filter_by(job_type=TriggererJobRunner.job_type) \
              .filter_by(hostname=hostname) \
              .order_by(Job.latest_heartbeat.desc()) \
              .limit(1) \
              .first()
          if (triggerer_job is not None) and triggerer_job.is_alive():
              pass
          else:
              sys.exit(f"The TriggererJob (id={triggerer_job.id}) for hostname '{hostname}' is not alive")
{{- end }}

{{- define "worker_lifecycle_prestop_command" }}
    - "timeout"
    - "{{ .Values.airflow.worker.celery.gracefullTerminationPeriod }}s"
    - "python"
    - "-Wignore"
    - "-c"
    - |
      import os
      import time
      import subprocess
      from celery import Celery
      from celery.app.control import Inspect
      from typing import List

      def run_command(cmd: List[str]) -> str:
          process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
          output, error = process.communicate()
          if error is not None:
            raise Exception(error)
          else:
            return output.decode(encoding="utf-8")

      broker_url = run_command(["bash", "-c", "echo $AIRFLOW__CELERY__BROKER_URL"])
      local_celery_host = f"celery@{os.environ['HOSTNAME']}"
      app = Celery(broker=broker_url)

      # prevent the worker accepting new tasks
      print(f"canceling celery consumer for {local_celery_host}...")
      app.control.cancel_consumer("default", destination=[local_celery_host])

      # wait until the worker finishes its current tasks
      i = Inspect(app=app, destination=[local_celery_host])
      active_tasks = i.active()[local_celery_host]
      while len(active_tasks) > 0:
          print(f"waiting [10 sec] for remaining tasks to finish: {[task.get('name') for task in active_tasks]}")
          time.sleep(10)
          active_tasks = i.active()[local_celery_host]
{{- end }}


{{- define "airflow_logs" -}}
  {{- printf "%s/logs" .Values.airflow.homeDir | quote }}
{{- end }}

{{- define "airflow_logs_volume_claim" -}}
  {{- if .Values.airflow.logs.persistence.existingClaim }}
    {{- .Values.airflow.logs.persistence.existingClaim }}
  {{- else }}
    {{- printf "%s-logs" .Release.Name }}
  {{- end }}
{{- end }}

{{- define "airflow_dags" -}}
  {{- if .Values.dags.gitSync.enabled }}
    {{- printf "%s/dags/repo/%s" .Values.airflow.homeDir .Values.dags.gitSync.subPath }}
  {{- else }}
    {{- printf "%s/dags" .Values.airflow.homeDir }}
  {{- end }}
{{- end }}

{{- define "airflow_pod_template_file" -}}
  {{- printf "%s/pod_templates" .Values.airflow.homeDir }}
{{- end }}

{{/*  Git sync container */}}
{{- define "git_sync_container" }}
- name: {{ .Values.dags.gitSync.containerName }}{{ if .is_init }}-init{{ end }}
  image: {{ .Values.dags.gitSync.image.repository }}:{{ .Values.dags.gitSync.image.tag }}
  imagePullPolicy: {{ .Values.dags.gitSync.image.pullPolicy }}
  env:
    - name: GIT_SYNC_REV
      value: {{ .Values.dags.gitSync.rev | quote }}
    - name: GIT_SYNC_BRANCH
      value: {{ .Values.dags.gitSync.branch | quote }}
    - name: GIT_SYNC_REPO
      value: {{ .Values.dags.gitSync.repo | quote }}
    - name: GIT_SYNC_DEPTH
      value: {{ .Values.dags.gitSync.depth | quote }}
    - name: GIT_SYNC_ROOT
      value: "/git"
    - name: GIT_SYNC_DEST
      value: "repo"
    - name: GIT_SYNC_ADD_USER
      value: "true"
    - name: GIT_SYNC_WAIT
      value: {{ .Values.dags.gitSync.wait | quote }}
    - name: GIT_SYNC_MAX_SYNC_FAILURES
      value: {{ .Values.dags.gitSync.maxFailures | quote }}
    {{- if .is_init }}
    - name: GIT_SYNC_ONE_TIME
      value: "true"
    {{- end }}
  resources: {{ toYaml .Values.dags.gitSync.resources | nindent 6 }}
  volumeMounts:
  - name: dags-data
    mountPath: /git
{{- end }}
