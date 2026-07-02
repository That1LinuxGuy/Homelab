{ pkgs, self, nixpkgs-unstable, ... }: 

# Any latest version packages I may need
let
  unstable = import inputs.nixpkgs-unstable
in

{
  environment.systemPackages =  [
    unstable.newelle
  ];
}
