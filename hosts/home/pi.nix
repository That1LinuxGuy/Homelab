{ inputs, config, pkgs, ... }:

{
  home.packages = [
    inputs.pi.x86_64-linux.${pkgs.stdenv.hostPlatform.system}.pi
  ];
}
