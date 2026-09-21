
{ config, pkgs, ... }:

# extra pieces for high-functioning laptops

{
  imports = [
    ./common/search.nix
    ./llama/llama.nix
  ];
}
