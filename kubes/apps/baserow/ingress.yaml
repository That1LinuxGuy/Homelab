apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: baserow-ingress
  namespace: baserow
spec:
  entryPoints:
    - websecure
  routes:
    - match: Host(`baserow.713602.xyz`)
      kind: Rule
      services:
        - name: baserow-baserow-frontend
          port: 80

  tls:    
    store:
      name: default
      namespace: kube-system
