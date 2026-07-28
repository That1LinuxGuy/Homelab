{ pkgs, ... }:

{
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
}
