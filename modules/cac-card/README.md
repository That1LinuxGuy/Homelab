# CAC card support for NixOS

This flake provides a NixOS module that installs OpenSC, CCID, and PC/SC
utilities, enables `pcscd`, and configures Firefox to use the OpenSC PKCS#11
module for CAC cards.

## Usage

Add the flake as an input to your NixOS configuration:

```nix
{
  inputs.cac-card.url = "github:<owner>/<repository>";

  outputs = { nixpkgs, cac-card, ... }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        cac-card.nixosModules.default
      ];
    };
  };
}
```

The named module alias is also available as `cac-card.nixosModules.cac`.

Then rebuild normally:

```sh
sudo nixos-rebuild switch --flake .#example
```

Connect a compatible reader and verify it is detected with `pcsc_scan`.
Firefox must be restarted after applying the configuration.
