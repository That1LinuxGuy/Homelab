{ pkgs, config, ... }:

# Niri configuration with noctalia-shell

{
  programs.niri = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        user = "myuser";
      };
    };
  };

  environment.systemPackages = with pkgs; [
  noctalia-shell
  xwayland-satellite
  alacritty
  fuzzel
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
