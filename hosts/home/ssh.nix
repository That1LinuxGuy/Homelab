
{ config, pkgs, ... }:

{
  programs.ssh= {
    enable = true;
    enableDefaultConfig = false;
  
    settings = {
      "github.com" = {
        user = "mcallen"; 
        identityFile = [ 
          "~/.ssh/bazzite-git"
          "~/.ssh/raikou"
        ]:
        identitiesOnly = true;
      };

      "*.spangled-vibes.ts.net" = {
        user = "mcallen";
        identityFile = "~/.ssh/bazzite";
        identitiesOnly = true;
      };
    };
  };
}
