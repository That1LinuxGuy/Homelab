{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # Remember to set a password
  users.users = {
    "mcallen" = {
      isNormalUser = true;
      description = "mcallen";
      extraGroups = [ "networkmanager" "wheel" "k3s" "scanner" "lp" ];
    };
    "shelby" = {
      isNormalUser = true;
      description = "shelby";
      extraGroups = [  "networkmanager" "wheel" "input" "scanner" "lp" ];
      packages = with pkgs; [
        google-chrome
      #  thunderbird
      ];
    };
    "charlotte" = {
      isNormalUser = true;
      description = "charlotte";
      extraGroups = [ "input" ];
    };
    "james" = {
      isNormalUser = true;
      description = "james";
      extraGroups = [ "input" ];
    };
  };

  users.groups.k3s = {};


  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    users = {
      mcallen = import ./m-home.nix;
      shelby = import ./s-home.nix;
      charlotte = import ./c-home.nix;
      james = import ./j-home.nix;
    };
  };
}

