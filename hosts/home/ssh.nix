
{ config, pkgs, ... }:

{
  programs.ssh= {
    enable = true;
    enableDefaultConfig = false;
  
    settings = {
      "github.com" = {
        user = "mcallen"; 
      };

      "*.spangled-vibes.ts.net" = {
        user = "mcallen";
        identityFile = "~/.ssh/bazzite";
        identitiesOnly = true;
      };
    };
  };
}
