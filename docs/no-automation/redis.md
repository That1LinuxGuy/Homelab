# Redis cluster failure

## Check logs

pods are named "redis-replicas-0" and "redis-replicas-1"
``` bash
kubectl logs -n redis redis-replicas-0
# OR
kubectl logs -n redis redis-replicas-1
```

Check output for errors.
If RDB (redis database) error appears, this means the master database is out of sync with the replicas.

## recreate replicas

As long as the master is intact, the replicas can be recreated with no issues.

``` bash
kubectl scale -n redis statefulset redis-replicas --repilcas=0
```

Then delete the associated PVCs:
``` bash
kubectl get pvc -n redis
# ONLY DELETE REPLICAS
kubectl delete -n redis pvc redis-data-redis-replicas-0 redis-data-redis-replicas-1
```

Then scale the redis replicas back to normal:
``` bash
kubectl scale -n redis statefulset redis-replicas --repilcas=0
 ```

## Final check

check that pods have been deployed succesfully:
``` bash
kubectl get all -n redis
```

