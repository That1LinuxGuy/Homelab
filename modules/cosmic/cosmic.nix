{ pkgs, config, ... }:

# Cosmic DE configuration

{
  # Enable the Cosmic Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.cosmic.enable = true;
}
