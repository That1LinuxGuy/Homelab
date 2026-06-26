{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-bulbasaur.nix
    ];

  networking.hostName = "bulbasaur"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  networking.firewall.allowedTCPPorts = [
    11434   # Ollama  
  ];
  
  environment.systemPackages = with pkgs; [
    ollama
  ];

  services.openiscsi = {
  enable = true;
  name = "${config.networking.hostName}";
  };

  # This tells Nix to append these strings together rather than overwriting them
  services.k3s.extraFlags = lib.mkAfter [
    "--node-label storage=ssd"
    "--node-label capacity=high"
    "--node-label ram=40gb"
  ];
    environment.variables = {
  KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
