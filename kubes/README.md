# My Kubernetes Setup with FluxCD

There are only 3 folders, each with a very specific purpose
- clusters | contains all the fluxCD data for my nodes, infrastructure, and apps
- infrastructure | contains all the applications that I need to support user facing content
- apps | contains all the user facing applications

## clusters

There is only one cluster currently in this directory. 

All of the infrastructure is managaed collectively inside (infrastcructure.yaml)[clusters/infrastructure.yaml)

Each application has it's own self-contained file so if one app fails, none of the other will. For example, (jellyfin.yaml)[clusters/jellyfin.yaml]

## infrastructure

The infrastructure is seperated into layers to ensure everything starts in the correct order and there are no missing dependacies. They are applied in this order
1. namespaces
2. secrets
3. configs
4. apps*

/kubes/infrastructure/apps is different from /kubes/apps | the first applies "top layers" such as the grafana ingress for the kube-promethes operator

## apps

each app contains its own directory that houses all the pieces needed for that applciation, including secrets.

Extra caution must be taken wiht applcations since there is no layer applciation. Everything is applied at the same time (managed by FluxCD) which does make it harder to identify where the problem lies with a larger app configuration.
