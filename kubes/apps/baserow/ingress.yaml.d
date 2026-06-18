apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: baserow
  namespace: baserow
spec:
  defaultBackend:
    service:
      name: baserow-baserow-frontend
      port:
        number: 80
  ingressClassName: tailscale
  tls:
    - hosts:
        - baserow
