{{/*
Expand the chart name to create fully qualified names
*/}}
{{- define "ldap-sync.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end }}

{{/*
Create labels for resources
*/}}
{{- define "ldap-sync.labels" -}}
app: "{{ template "ldap-sync.name" . }}"
chart: "{{ .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}"
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "ldap-sync.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ldap-sync.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}