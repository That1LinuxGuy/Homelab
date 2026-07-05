{ pkgs, config, inputs, ... }:

# sddm login manager configuration

{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  
    theme = "sddm-astronaut-theme";
    settings = {
      Theme= {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    extraPackages = with pkgs; [
      sddm-astronaut
      bibata-cursors
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    bibata-cursors
  ];
}
