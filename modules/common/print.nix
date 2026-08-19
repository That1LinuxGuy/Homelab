
{ config, pkgs, ... }:

# Add printing to a machine

{  
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  # Enable SANE for scanning
  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.sane-airscan];
  };
  services.udev.packages = [ pkgs.sane-airscan ];
}
