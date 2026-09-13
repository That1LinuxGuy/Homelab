{ inputs, config, pkgs, ... }:

{
  home.packages = [
    inputs.pi.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];
}
