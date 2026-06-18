# Troubleshooting ingress issues

This is my step by step guide to fixing Ingress issues in a kubernetes cluster. Results may vary depending on which services are running: I am using the traefik reverse proxy with a metalLB external IP address

## Verify cluster connection

Port forward the service to localhost:
``` bash
kubectl port-forward -n {namespace} svc/{service-name} localPort:servicePort
# Open a second terminal

curl -kvH "Host: your.domain.name" http(s)//localhost:localPort
# k=insecure, v=verbose, H=header
```

200 OK --> internal service is working
404 NOT FOUND --> interal service is not working
302 REDIRECT --> additional verification required

## Internal Service works, but still no connection

Verify that the router can forward the request
``` bash
curl -kvH "Host: your.domain.name" https://router-ip-address
```

The error message I received states: "TLS connect error: unexpected eof while reading"\
This means the service does not have access to the TLS certificate

## Received 404 from step 1

verify pod state
```bash
kubectl get all -n {service-namespace}
# check for ERROR, CrashLoopBackOff, or any 0/1 pods

kubectl describe -n (service-namespace} pod {pod-name}
# check events to see if there are any errors

kubectl logs -n (service-namespace} {pod-name} (--previous)
# check for errors like db or s3 storage connection issues
```

## Check ingress policy for the application

Because step 1 skips TLS verify, we have to make sure the app can use the certificate
```bash
kubectl describe -n {application-ns} ingress(route) {ingress-name}
```

verify that tls is set with store.name and store.namespace (if using TLSstore)

