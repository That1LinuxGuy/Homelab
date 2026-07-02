{
  description = "Master flake to manage host machines configurations";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # NixOS unstable package source
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs,  ... }@inputs: {
    nixosConfigurations = {

     # master node | pokedex 001
     bulbasaur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/bulbasaur/bulbasaur.nix
          ./modules/common/default.nix
          ./modules/common/vim.nix
          ./modules/common/network.nix
          ./modules/k3s/k3s-master.nix
        ];
      };

      # server node | pokedex 004
      squirtle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/squirtle/squirtle.nix
          ./modules/common/default.nix
          ./modules/common/vim.nix
          ./modules/common/network.nix
          ./modules/k3s/k3s-server.nix
        ];
      };

      # server node | pokedex 007
      charmander = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/charmander/charmander.nix
          ./modules/common/default.nix
          ./modules/common/vim.nix
          ./modules/common/network.nix
          ./modules/k3s/k3s-server.nix
        ];
      };

      # work laptop | pokedex 025
      pikachu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pikachu/pikachu.nix
          ./modules/common/default.nix
          ./modules/common/network.nix
          ./modules/common/vim.nix
          ./modules/niri/niri.nix
          ./modules/plasma/plasma.nix
          ./modules/unstable/packages.nix
        ];
      };
    };
  };
}
