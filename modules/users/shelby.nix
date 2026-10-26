
{ config, pkgs, ... }:

# Add the shelby user

{  
  # Remember to set a password
  users.users."shelby" = {
    isNormalUser = true;
    description = "shelby";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    packages = with pkgs; [
      kdePackages.kate
      google-chrome
  };

  xdg.desktopEntries.youtube-music = {
    name = "YouTube Music";
    exec = "${pkgs.chromium}/bin/chromium --app=https://music.youtube.com";
    icon = "../../images/youtube-music.png";
    terminal = false;
    categories = [ "Audio" "Music" ];
  };

  xdg.desktopEntries.chatgpt = {
    name = "ChatGPT";
    exec = "${pkgs.chromium}/bin/chromium --app=https://chatgpt.com";
    icon = "../../images/chatgpt.png";
    terminal = false;
    categories = [ "Developemt" "Utilities" ];
  };

  nixpkgs.config.allowUnfree = true

}
