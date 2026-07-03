{ pkgs, self, inputs, ... }: 

# Any latest version packages I may need

{
  environment.systemPackages =  [
   unstable.legacyPackages.${pkgs.system}.newelle 
  ];
}
