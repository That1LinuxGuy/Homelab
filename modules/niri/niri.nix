{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{
  programs.niri.enable = true;

  services.displayManager.sddm.enable = true;
  
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

  services.xserver = {
    enable = false;
  };
}
