{ pkgs, config, ... }:

# Cosmic DE configuration

{
  # Enable the Cosmic Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.enable = false;
  services.desktopManager.cosmic.enable = true;
}
