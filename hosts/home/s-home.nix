{ config, pkgs, inputs, ... }:

  # home manager config for shelby user
{
  imports = [ ];

  home.username = "shelby";
  home.homeDirectory = "/home/shelby";
  home.stateVersion = "26.05";

  packages = with pkgs; [
      google-chrome
    ];

  xdg.desktopEntries.youtube-music = {
    name = "YouTube Music";
    exec = "${pkgs.chrome}/bin/chromium --app=https://music.youtube.com";
    icon = "../../images/youtube-music.png";
    terminal = false;
    categories = [ "Audio" "Music" ];
  };

  xdg.desktopEntries.chatgpt = {
    name = "ChatGPT";
    exec = "${pkgs.chrome}/bin/chromium --app=https://chatgpt.com";
    icon = "../../images/chatgpt.png";
    terminal = false;
    categories = [ "Developemt" "Utilities" ];
  };
}
