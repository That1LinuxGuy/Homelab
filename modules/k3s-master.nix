{ pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = "/var/lib/rancher/k3s/server/node-token";
    clusterInit = true;
  };
}
