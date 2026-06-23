{ config, pkgs, ... }:

# Custom Vim setup for my use case

{
  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace ];
        opt = [];
      };
      vimrcConfig.customRC = ''
        " your custom vimrc
        set nocompatible
        set number
        set relativenumber
        set hlsearch
        set incsearch
        set tabstop=2
        set shiftwidth=4
        set expandtab
        " Turn on syntax highlighting by default
        syntax on
        " ...
      '';
    }
  )];
}

