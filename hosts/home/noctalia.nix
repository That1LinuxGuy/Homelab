{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  programs.noctalia = {
    enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}

