{ pkgs, config, inputs, ... }:

# sddm login manager configuration

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  
    theme = "elegant-sddm";
    settings = {
      Theme= {
        CursorTheme = "COSMIC";
        CursorSize = 24;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    elegant-sddm
    cosmic-icons
  ];
}
