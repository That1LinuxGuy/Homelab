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

<<<<<<< HEAD
  home.packages = with pkgs; [
=======
  packages = with pkgs; [
    # Windows VM stuff
    quickemu
    spice-gtk
    virt--viewer

    # Basics
>>>>>>> a69c8fd (add virt stuff to m-home)
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
    wget
    hugo
    kubectl
    fluxcd
    terraform
    python313Packages.huggingface-hub
  ];
}
