{ pkgs, config, ... }:

# KDE Plasma configuration

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
}
