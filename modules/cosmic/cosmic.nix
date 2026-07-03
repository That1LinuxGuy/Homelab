{ pkgs, config, ... }:

# Cosmic DE configuration

{
  # Enable the Cosmic Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin"
    };
  };

  services.desktopManager.cosmic.enable = true;
}
