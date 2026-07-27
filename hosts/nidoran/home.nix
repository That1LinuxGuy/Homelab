{ pkgs, ... }:

{
  imports = [
    ./vim.nix
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

  programs.bash = {
    enable = true;
    shellAliases = {
      # nixos commands
      "sysrb" = " home-manager switch --flake '.#mcallen@nidoran'";
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


  home.packages = with pkgs; [
    rofi 
    mako
    waybar
    swaybg
    openssh
  ];

  programs.home-manager.enable = true;
}
