
{ config, pkgs, ... }:

{
  programs.ssh= {
    enable = true;
    enableDefaultConfig = false;
  
    settings = {
      "github.com" = {
        hostname = "github.com";
        user = "git"; 
        identityFile = "~/.ssh/chrome";
        identitiesOnly = true;
      };
    };
  };
}
