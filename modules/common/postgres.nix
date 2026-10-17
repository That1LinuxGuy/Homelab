{ config, pkgs, ... }:

# Local PostgreSQL service for development databases.
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;

    # Create a local role and database for Django development.
    ensureUsers = [
      {
        name = "mcallen";
        ensureDBOwnership = true;
      }
    ];
    # ensureDBOwnership requires a database with the same name as the user.
    ensureDatabases = [ "mcallen" ];
  };
}
