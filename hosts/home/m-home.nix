{ config, pkgs, inputs, ... }:

{
  imports = [
<<<<<<< HEAD:hosts/raikou/home.nix
   ../home/alacritty.nix
   ../home/vim.nix
   ../home/bash.nix
   ../home/ssh.nix
   ../home/noctalia.nix
   ../home/pi.nix
=======
   ./alacritty.nix
   ./vim.nix
   ./bash.nix
   ./ssh.nix
>>>>>>> 9c4eda7 (checkpoint):hosts/home/m-home.nix
 ];

  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "$HOME/Projects/homelab";
  }; 
}
