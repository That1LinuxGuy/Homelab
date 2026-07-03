{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{

  services.displayManager.noctalia-greeter = {
    enable = true:

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        package = pkgs.adwaita-icon-theme;
      };
    };

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
  noctalia-shell
  xwayland-satellite
  alacritty
  fuzzel
  mpvpaper
  swaylock
  nautilus
  sddm-astronaut
  ];

  environment.etc."xdg/niri/config.kdl".source = ./config.kdl;
  systemd.user.services.niri.enableDefaultPath = false;
}
