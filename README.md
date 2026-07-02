# NixOS Homelab with K3S

Welcome to my homelab! This is a massive upgrade for me personally - I have been working with Linux for years and containerization for a while, so I wanted to step up my game and work with Orchestration.

## Setup:

I like Pokemon, so naturally I named my three systems after the starters from my original Leaf Green run.

I have a repurposed Chromebox, an HP prodesk, and an old dell latitude. They are nicknamed "bulbasaur", "charmander", and "squirtle" respectively.

For the OS, I wanted something I could set, forget, and easily copy to new machines when I *obviously* expand my hardware selection. Thus, NixOS was a natural choice.

## Tasks:

- [x] Setup FluxCD to automate deployments, monitoring, and scaling
- [x] Re-install Longhorn so Flux can manage configuration
- [x] Replace servicelb with metallb
- [x] Install tailscale kube operator
- [x] Install and configure Prometheus/Grafana
- [x] Setup CloudNativePG for DB storage
- [x] Setup Cert-manager for automated wildcard certificate management
- [x] Setup Bitnami Chart for Redis
- [x] Setup Garage for S3 compatible storage
- [x] Install OwnCloud Infinite Scale
- [x] Cry tears of joy

## Layout:

I tried to make it simple. It makes sense to me at least. Each machine is funneled into flake.nix

in /hosts, I have all my machines and hardware \
in /modules, I have all the various pieces I plug into my flake.nix \
in /kubes, I have my fluxCD monorepo configs for all my containers
- check out the [README](/kubes/README.md) in that folder for more info on kubernetes.

## Issues:

My biggest concern currently is hardware. In the [etcd guide](https://etcd.io/docs/v3.3/op-guide/hardware/) it specifically states "Fast disks are the most critical factor for etcd deployment performance and stability" \
To date, I have had no issues running etcd on a HDD disk. Thankfully, my cluster is small, which has kept etcd from expanding too much. 

Another issue is mentally shifting from "Deploying" to "Automating":
``` bash
docker compose up -d
```
this deploys an app 
``` bash
kubectl apply -f
# OR
helm install
```
This also deploys an app

Now, I use this workflow:
```bash
git add .
git commit -m "message"
git push
# wait a few seconds just in case
flux reconcile source git flux-system
```
However, this has also led to some issues. Because I have no automated testing set up, I regularly misgonfigure a file. When this happens, I only know because flux tells me or because my cluster isn't acting the way I *thought* I configured it.

Lastly, netowrking has been challenging. As I work to get my cloudflare account connected to my internal services, I realized that my metalLB ip address for the traefik proxy rotates between devices. Because my my routers limitations, I am only able to port forward based on hostname. Since I cannot port forward to the IP address of my traefik proxy, my cloudflare is unable to reach my cluster. 

