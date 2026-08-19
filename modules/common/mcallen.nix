
{ config, pkgs, ... }:

# Add the admin user mcallen

{  
  # Remember to set a password
  users.users."mcallen" = {
    isNormalUser = true;
    description = "mcallen";
    extraGroups = [ "networkmanager" "wheel" "k3s" "scanner" "lp" ];
    linger = true;
    packages = with pkgs; [
      kdePackages.kate
      vim
      git
    ];
  };

  users.groups.k3s = {}; 
}
