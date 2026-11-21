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
    newelle
    localsend
    brave
    simple-scan
    zoom-us
    vesktop

    # photos
    switcheroo
    upscayl
    loupe

    # gaming stuff
    retroarch-free
    pcsx2
    luanti

    # dev tools
    vim
    wget
    hugo
    kubectl
    fluxcd
    terraform
    python313Packages.huggingface-hub
  ];
}
