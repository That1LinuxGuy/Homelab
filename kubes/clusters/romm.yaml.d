apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: romm-app
  namespace: flux-system
spec:
  interval: 10m0s
  path: ./kubes/apps/romm 
  prune: true
  sourceRef:
    kind: GitRepository
    name: flux-system
