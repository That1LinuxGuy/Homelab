{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.enable = false;
  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
  noctalia-shell
  xwayland-satellite
  alacritty
  fuzzel
  mpvpaper
  swaylock
  nautilus
  ];

  environment.etc."xdg/niri/config.kdl".source = ./config.kdl;
  systemd.user.services.niri.enableDefaultPath = false;
}
