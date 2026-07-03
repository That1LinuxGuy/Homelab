{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        package = pkgs.adwaita-icon-theme;
      };
    };
  };

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
  noctalia.legacyPackages.${pkgs.system}.default
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
