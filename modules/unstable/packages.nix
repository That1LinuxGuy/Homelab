{ pkgs, self, nixpkgs-unstable, ... }: 

let
  unstable = nixpkgs-unstable.legacyPackages.${system};
in
{
  environment.systemPackages = with pkgs; [
    unstable.newelle
  ];
}
