{ config, pkgs, ... }:

# Configuration for functional school devices

{
  imports = [
    ./common/default.nix
    ./common/network.nix
    ./common/print.nix
    ./common/kernel.nix
    ./common/boot.nix
    ./cosmic/cosmic.nix
    ./cac-card/cac.nix
  ];
}
