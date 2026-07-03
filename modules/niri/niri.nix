{ pkgs, config, inputs, ... }:

# Niri configuration with noctalia-shell

{

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
  inputs.noctalia.packages.${pkgs.system}.default
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
