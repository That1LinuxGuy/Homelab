# Troubleshooting ingress issues

## Verify cluster connection

Port forward the service to localhost:
``` bash
kubectl port-forward -n {namespace} svc/{service-name} localPort:servicePort
# In a second terminal
curl -kvH "Host: your.domain.name" http(s)//localhost:localPort
# k=insecure, v=verbose, H=header
```

200 OK --> internal service is working
404 NOT FOUND --> interal service is not working
302 REDIRECT --> additional verification required


