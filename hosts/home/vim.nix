{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lastplace
      vim-sensible
      vim-airline
      vim-go
    ];
    settings = {
      "number" = true;
      "relativenumber" = true;
      "expandtab" = true;
      "tabstop" = 2;
      "shiftwidth" = 4;
    };
    extraConfig = ''
      syntax on
    '';
  };
}
