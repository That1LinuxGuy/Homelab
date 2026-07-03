{ pkgs, config, ... }:

# Cosmic DE configuration

{
  services.displayManager.noctalia-greeter = {
    enable = true;

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        package = pkgs.adwaita-icon-theme;
      };
    };
  };

  services.desktopManager.cosmic.enable = true;
}
