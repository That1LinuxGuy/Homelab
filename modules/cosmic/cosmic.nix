{ pkgs, config, ... }:

# COSMIC DE configuration

{
  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.system76-scheduler.enable = true;
  
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
}
