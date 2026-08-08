{
  description = "Master flake to manage host machines configurations";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # NixOS unstable package source
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # NixOS Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia-shell flake
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "unstable";
    }; 
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {

      # master node | pokedex 001
      bulbasaur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/bulbasaur/bulbasaur.nix
          ./modules/master.nix
        ];
      };

      # server node | pokedex 004
      squirtle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/squirtle/squirtle.nix
          ./modules/server.nix
        ];
      };

      # server node | pokedex 007
      charmander = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/charmander/charmander.nix
          ./modules/server.nix
        ];
      };

      # work laptop | pokedex 025
      pikachu = nixpkgs.lib.nixosSystem { 
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pikachu/pikachu.nix
          ./modules/laptop.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
 
      # work laptop | pokedex 243
      raikou = nixpkgs.lib.nixosSystem { 
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/raikou/raikou.nix
          ./modules/laptop.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      #ARM Chromebook | pokedex 029
      "mcallen@nidoran" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
	extraSpecialArgs = {inherit inputs; };
	modules = [
	  ./hosts/nidoran/home.nix
	];
      };
    };
  };
}
