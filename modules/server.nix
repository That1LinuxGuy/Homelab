{ config, pkgs, ... }:

# Configuration for K3S master node

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/kubernetes.nix
    ./k3s/k3s-server.nix
  ];
}
