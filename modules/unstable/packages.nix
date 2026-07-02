{ pkgs, self, nixpkgs-unstable, ... }: 

# Any latest version packages I may need

{
  environment.systemPackages =  [
    unstable.newelle
  ];
}
