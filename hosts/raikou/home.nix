
{ config, pkgs, inputs, ... }:

{
  imports = [
   ../home/alacritty.nix
   ../home/vim.nix
   ../home/bash.nix
   ../home/ssh.nix
 ];

  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "$HOME/Projects/homelab";
  }; 
}
