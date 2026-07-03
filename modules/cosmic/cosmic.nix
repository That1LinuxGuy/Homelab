{ pkgs, config, ... }:

# Cosmic DE configuration

{
  # Enable the Cosmic Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [pkgs.sddm-astronaut];
  services.desktopManager.cosmic.enable = true;

  environment.systemPackages = with pkgs; [
  sddm-astronaut
  ];
}
