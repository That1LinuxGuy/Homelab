{ pkgs, ... }:

{
  # Import this module from a user's Home Manager configuration to install Calibri for that user.
  home.packages = [
    (pkgs.runCommandLocal "calibri-fonts" { } ''
      mkdir -p $out/share/fonts/truetype
      cp ${./fonts}/*.ttf $out/share/fonts/truetype/
    '')
  ];

  fonts.fontconfig.enable = true;
}
