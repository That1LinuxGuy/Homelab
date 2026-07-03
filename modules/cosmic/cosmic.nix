{ pkgs, config, ... }:

# Cosmic DE configuration

{
  # Enable the Cosmic Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin":
    };
    
    theme = "sddm-astronaut-theme";
    extraPackages = [pkgs.sddm-astronaut];
    
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
        CursorSize = 24:
      };
    };
  };

  services.desktopManager.cosmic.enable = true;

  environment.systemPackages = with pkgs; [
  sddm-astronaut
  ];
}
