{ config, pkgs, ... }:

# Configuration for functional school devices

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/print.nix
    ./common/boot.nix
    ./cosmic/cosmic.nix
    ./packages/school.nix
    ./luanti/luanti.nix
    ./cac-card/cac.nix
  ];
}
