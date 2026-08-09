{ config, pkgs, ... }:

# Configuration for functional school devices

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/print.nix
    ./sddm/sddm.nix
    ./plasma/plasma.nix
  ];
}
