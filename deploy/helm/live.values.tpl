# Default values for helm_deploy.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 2

image:
  repository: ${ECR_URL}
  tag: ${IMAGE_TAG}
  pullPolicy: IfNotPresent

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

service:
  port: 8082
  targetPort: 8082

ingress:
  enabled: true
  annotations:
    external-dns.alpha.kubernetes.io/set-identifier: "githubaction-cloud-platform-reference-app-github-action-green"
    external-dns.alpha.kubernetes.io/aws-weight: "0"
  hosts:
    - host: cp-reference-github-actions.apps.live-1.cloud-platform.service.justice.gov.uk
      paths: /

  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources: {}
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  # limits:
  #   cpu: 100m
  #   memory: 128Mi
  # requests:
  #   cpu: 100m
  #   memory: 128Mi

nodeSelector: {}

tolerations: []

affinity: {}
