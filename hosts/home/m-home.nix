{ config, pkgs, inputs, ... }:

{
  imports = [
    ./alacritty.nix
    ./vim.nix
    ./bash.nix
    ./ssh.nix
    ./pi.nix
 ];

  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "$HOME/Projects/homelab";
  }; 
}
