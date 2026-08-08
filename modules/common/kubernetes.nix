{ config, pkgs, ... }:

# Setup K3S config for nixOS

{
  boot.kernelModules = [ "iscis_tcp" "libiscsi" ];  

  systemd.services.iscsid.serviceConfig = {
    PrivateMounts = "no";
    BindPaths = "/run/current-system/sw/bin:/bin";
    TimeoutStartSec = "30";
  };

  systemd.tmpfiles.rules = [
    # Create a symbolic link /usr/bin/mount -> /run/current-system/sw/bin/mount
    "L /usr/bin/mount - - - - /run/current-system/sw/bin/mount"
  ];

  # Enable git with global config
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "That1LinuxGuy";
        email = "mcallen71398@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    openiscsi
    fluxcd
    yaml-language-server
    sops
    age
    gnupg
    (wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-secrets
        helm-diff
        helm-s3
        helm-git
      ];
    })
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    53   # DNS resultion
    80   # HTTP
    443  # HTTPS
    6443 # k3s: required so pods can reach API server
    2379 # k3s, etcd clients: required for High Availability etcd
    2380 # k3s, etcd clients: required for High Availability etcd
    10250# K3S, metrics server: required for logs and metrics
  ];

  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
    53   # DNS resolution
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
  services.fail2ban.enable = true;
}
