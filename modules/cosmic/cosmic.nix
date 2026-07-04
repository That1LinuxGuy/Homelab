{ pkgs, config, inputs, ... }:

# Cosmic DE configuration

{
  imports = [
    ../sddm/sddm.nix
  ];
  
  services.desktopManager.cosmic = {
    enable = true;
    xwayland.enable = true;
  };
}
