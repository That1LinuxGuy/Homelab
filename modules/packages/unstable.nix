{ pkgs, self, inputs, ... }: 

# Any latest version packages I may need

{
  environment.systemPackages =  [
   inputs.unstable.legacyPackages.${pkgs.system}.libreoffice
   inputs.unstable.legacyPackages.${pkgs.system}.ryubing
   inputs.inferzero-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
