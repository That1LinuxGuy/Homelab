{
  description = "NixOS module for Common Access Card (CAC) support";

  outputs = { self }: {
    # The default output makes the flake directly usable as a NixOS module.
    nixosModules.default = import ./cac.nix;

    # Named alias for configurations that prefer an explicit module name.
    nixosModules.cac = self.nixosModules.default;
  };
}
