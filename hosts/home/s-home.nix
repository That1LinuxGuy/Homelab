{ config, pkgs, inputs, ... }:

  # home manager config for shelby user
{
  imports = [ ];

  home.username = "shelby";
  home.homeDirectory = "/home/shelby";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
      google-chrome
    ];

  home.file = {
    ".local/share/icons/hicolor/96x96/apps/youtube-music.png".source = ../../images/youtube-music.png;
    ".local/share/icons/hicolor/256x256/apps/chatgpt.png".source = ../../images/chatgpt.png;
  };

  xdg.desktopEntries.youtube-music = {
    name = "YouTube Music";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --app=https://music.youtube.com";
    icon = "youtube-music";
    terminal = false;
  };

  xdg.desktopEntries.chatgpt = {
    name = "ChatGPT";
    exec = "${pkgs.google-chrome}/bin/google-chomre-stable--app=https://chatgpt.com";
    icon = "chatgpt";
    terminal = false;
  };
}
