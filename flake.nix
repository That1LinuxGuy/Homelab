{
  description = "Master flake to manage k3s node configuration";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {

     # master node | pokedex 001
     bulbasaur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./common/network.nix
          ./hosts/bulbasaur/bulbasaur.nix
          ./modules/k3s/k3s-master.nix
        ];
      };

      # server node | pokedex 004
      squirtle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./common/network.nix
          ./hosts/squirtle/squirtle.nix
          ./modules/k3s/k3s-server.nix
        ];
      };

      # server node | pokedex 007
      charmander = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./common/network.nix
          ./hosts/charmander/charmander.nix
          ./modules/k3s/k3s-server.nix
        ];
      };

      # work laptop | pokedex 025
      pikachu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./common/network.nix
          ./hosts/pikachu/pikachu.nix
          ./modules/niri/niri.nix
          ./modules/plasma/plasma.nix
        ];
      };
    };
  };
}
