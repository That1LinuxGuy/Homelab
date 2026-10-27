{ pkgs, ... }:

# sddm login manager configuration

{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  
    theme = "breeze";
    settings = {
      Theme= {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    extraPackages = with pkgs; [
      kdePackages.plasma-desktop
      bibata-cursors
    ];
  };

  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
