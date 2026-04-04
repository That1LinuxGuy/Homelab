{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
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
          ./modules/k3s-master.nix # Only included here
        ];
      };

      # server node | pokedex 003
      squirtle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./common/network.nix
          ./hosts/squirtle/squirtle.nix
          ./modules/k3s-server.nix # Only included here
        ];
      };
    };
  };
}
