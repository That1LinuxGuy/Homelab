{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lastplace
    ];
    extraConfig = ''
      set nocompatible
      set number
      set relativenumber
      set hlsearch
      set incsearch
      set tabstop=2
      set shiftwidth=4
      set expandtab
      syntax on
    '';
  };
}
