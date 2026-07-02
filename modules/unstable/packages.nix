{ pkgs, self, unstable, ... }: 

# Any latest version packages I may need

{
  environment.systemPackages =  [
   nixpkgs-unstable.legacyPackages.${pkgs.system}.newelle 
  ];
}
