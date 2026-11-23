{ config, pkgs, ... }:

# Configuration for functional laptop

{
  imports = [
    ./common/default.nix
    ./common/network.nix
    ./common/print.nix
    ./common/boot.nix
    ./common/kernel.nix
    ./games/steam.nix
    ./games/luanti.nix
    ./packages/unstable.nix
    ./cosmic/cosmic.nix
  ];
}
