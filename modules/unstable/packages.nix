{ pkgs, self, inputs, ... }: 

# Any latest version packages I may need

{
  nixpkgs.config.packageOverrides = pkgs: {
    newelle = pkgs.newelle.overrideAttrs (oldAttrs: {
      propagatedBuildInputs = oldAttrs.propagatedBuildInputs or [] ++ [
        pkgs.python3Packages.model2vec
        pkgs.python3Packages.cssselect
      ];
    });
  };

  environment.systemPackages =  [
   inputs.unstable.legacyPackages.${pkgs.system}.newelle 
  ];
}
