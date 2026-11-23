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
<<<<<<< HEAD
=======
    ./packages/school.nix
    ./games/luanti.nix
>>>>>>> 1de3cf3 (module fixes)
    ./cac-card/cac.nix
  ];
}
