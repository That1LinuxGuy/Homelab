{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    
    theme = "sddm-astronaut-theme";
    extraPackages = [pkgs.sddm-astronaut];
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
