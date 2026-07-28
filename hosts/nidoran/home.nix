{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./vim.nix
    ./bash.nix
    ./waybar.nix
    ./mako.nix
  ];

  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "$HOME/Projects/homelab";
  };
  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "/nix/var/nix/profiles/default/bin"
  ];

  home.packages = with pkgs; [
    rofi 
    mako
    waybar
    swaybg
    openssh
  ];

  programs.home-manager.enable = true;
  programs.chromium = {
    enable = true;
    package = pkgs.brave.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
      ];
    };
  };
}
