{{/*
Expand the chart name to create fully qualified names
*/}}
{{- define "ldapsync.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end }}

{{/*
Create labels for resources
*/}}
{{- define "ldapsync.labels" -}}
app: "{{ template "ldapsync.name" . }}"
chart: "{{ .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}"
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "ldapsync.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ldapsync.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}