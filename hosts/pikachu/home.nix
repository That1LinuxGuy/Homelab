
{ config, pkgs, inputs, ... }:

{  
  programs.bash = {
    enable = true;
      sessionVariables = {
      EDITOR = "vim";
      FLAKE = "$HOME/Projects/homelab";
    }; 
    shellAliases = {
      # nixos commands
      "sysrb" = "sudo nixos-rebuild switch --flake ~/Projects/homelab#pikachu";
      "sysgc" = "sudo nix-collect-garbage --delete-older-than";
      "b" = "ssh bulbasaur.spangled-vibes.ts.net";
      "s" = "ssh squirtle.spangled-vibes.ts.net";
      "c" = "ssh charmander.spangled-vibes.ts.net";
      
      # kubernetes commands
      "k" =  "kubectl";
      "kgp" = "kubectl get pods";
      "kga" = "kubectl get all";
      "kgns" = "kubectl get ns";
      
      # system commands
      "..."="cd ../..";
      "...."="cd ../../..";
      "ff" = "fastfetch";
      "cdh" = "cd ~/Projects/homelab";
      
      # git commands
      "ga" = "git add .";
      "gcm" = "git commit -m";
      "gpu" = "git push -u origin";
    };
  };

  programs.vim = {
    enable = true;
    settings = {
      "nocompatible" = true;
      "number" = true;
      "relativenumber" = true;
      "hlsearch" = true;
      "incsearch" = true;
      "synax on" = true;
      "expandtab" = true;
      "tabstop" = 2;
      "shiftwidth" = 4;
    };
    plugins = with pkgs.vimPlugins; [
      sensible
      vim-airline
      fugutive
      vim-go
    ];
  };
}
