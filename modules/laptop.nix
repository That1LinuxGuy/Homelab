{ config, pkgs, ... }:

# Configuration for functional laptop

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/print.nix
    ./niri/niri.nix
    ./unstable/packages.nix
  ];
}
