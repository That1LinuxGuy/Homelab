{ pkgs, self, inputs, ... }: 

# Any latest version packages I may need

{
  environment.systemPackages =  [
   inputs.unstable.legacyPackages.${pkgs.system}.newelle 
   inputs.unstable.legacyPackages.${pkgs.system}.libreoffice
  ];
}
