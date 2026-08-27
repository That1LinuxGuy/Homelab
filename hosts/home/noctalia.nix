{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeManagerModules.default
  ]:

  programs.noctalia = {
    enable = true;
    
  };
}
