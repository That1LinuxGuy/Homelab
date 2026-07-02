{ pkgs, self, nixpkgs-unstable, ... }: 

let
  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  environment.systemPackages = with pkgs; [
    unstable.newelle
  ];
}
