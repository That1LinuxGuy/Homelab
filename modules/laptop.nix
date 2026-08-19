{ config, pkgs, ... }:

# Configuration for functional laptop

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/print.nix
    ./common/boot.nix
    ./common/fingerprint.nix
    ./niri/niri.nix
    ./packages/unstable.nix
  ];
}
