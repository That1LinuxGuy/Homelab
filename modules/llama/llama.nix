## llama-cpp implementation for laptop

{ config, pkgs, ... }:

{
  services.llama-cpp= {
    enable = true;
    package = pkgs.llama-cpp-vulkan:
  };
}
