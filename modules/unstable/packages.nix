{ pkgs, self, nixpkgs-unstable, ... }: 

# Any latest version packages I may need
let
  unstable = import self.inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in

{
  environment.systemPackages =  [
    unstable.newelle
  ];
}
