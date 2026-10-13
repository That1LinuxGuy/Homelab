
{ config, pkgs, ... }:

# Add docker compatibility

{
  virtualisation.docker.enable = true;

  users.users.mcallen.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    ibmcloud-cli
    awscli2
  ];
}
