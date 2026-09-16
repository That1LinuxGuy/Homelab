# ./shells/default.nix
{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
    pnpm
    git
  ];

  shellHook = ''
    echo "React.js shell active!"
  '';
}
