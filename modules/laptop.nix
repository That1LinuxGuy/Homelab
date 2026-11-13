{ config, pkgs, ... }:

# Configuration for functional laptop

{
  imports = [
    ./common/default.nix
    ./common/mcallen.nix
    ./common/network.nix
    ./common/print.nix
    ./common/boot.nix
    ./common/kernel.nix
    ./games/steam.nix
    ./packages/unstable.nix
    ./packages/tools.nix
    ./packages/emu.nix
<<<<<<< HEAD
=======
    # ./plasma/plasma.nix
>>>>>>> 60881d0 (add stable-diffusion)
    ./cosmic/cosmic.nix
  ];
}
