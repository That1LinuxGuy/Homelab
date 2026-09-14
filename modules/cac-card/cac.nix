{ config, pkgs, ... }:

# A single Nix flake to enable CAC card support in any browser.
{  
  # Install CAC card tools
  environment.systemPackages = with pkgs; [
    opensc
    ccid
    pcsc-tools
  ];

  # Enable pcsc daemon for CAC card reader
  services.pcscd.enable = true;

  # Install firefox.
  programs.firefox = {
    enable = true;
  
    # Enable opensc in firefox for CAC card use
    policies = {
      SecurityDevices = {
        Add = {"CAC card" = "/run/current-system/sw/lib/opensc-pkcs11.so"; };
      };
    };
  };
}
