
apiVersion: source.toolkit.fluxcd.io/v1
kind: HelmRepository
metadata:
  name: garage
  namespace: flux-system
spec:
  interval: 24h
  url: https://datahub-local.github.io/garage-helm
