{ config, pkgs, ... }:

# Add Steam to raikou for DarkSouls III

{
  progams.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
  ];
}
