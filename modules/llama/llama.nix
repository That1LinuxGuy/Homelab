## llama-cpp implementation for laptop

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    llama-cpp-vulkan
  ];

  services.llama-cpp= {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
  };
}
