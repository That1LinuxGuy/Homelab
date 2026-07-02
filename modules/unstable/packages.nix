{ pkgs, self, nixpkgs-unstable, ... }: 

# Any latest version packages I may need

{
  specialArgs = let
    system = "x86_64-linux";
  in {
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };

  {
    environment.systemPackages =  [
      unstable.newelle
    ];
  };
}
