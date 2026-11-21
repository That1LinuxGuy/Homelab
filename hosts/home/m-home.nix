{ config, pkgs, inputs, ... }:

{
  imports = [
    ./alacritty.nix
    ./vim.nix
    ./bash.nix
    ./ssh.nix
    ./pi.nix
    ./fonts.nix
 ];

  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "$HOME/Projects/homelab";
  }; 

  packages = with pkgs; [
    vim
    newelle
    localsend
    brave
    kdePackages.skanpage
    zoom-us

    # photos
    switcheroo
    upscayl
    loupe

    # gaming stuff
    retroarch-free
    pcsx2
    luanti

    # Hugging Face
    python313Packages.huggingface-hub
  ];

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  users.users.mcallen.extraGroups = [ "gamemode" ];  
}
