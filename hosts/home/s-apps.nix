{ config, pkgs, ... }:

{
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
