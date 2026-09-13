## llama-cpp implementation for laptop

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    llama-cpp-vulkan
  ];

  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    host = "127.0.0.1";
    port = 8080;
    extraFlags = [
      "-ngl" "99"
      "-t" "2"
      "-c" "16384"
      "-fa" "on"
      "-ctk" "q8_0"
      "-ctv" "q8_0"
      "--models-dir" "/var/lib/models"
      "--reasoning-budget" "-1"
    ];
  };
}
