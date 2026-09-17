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
      "-t" "4"
      "-c" "16384"
      "-ctk" "q8_0"
      "-ctv" "q8_0"
      "-b" "512"
      "-ub" "64"
      "--jinja"
      "--models-dir" "/var/lib/models"
      "--reasoning-budget" "-1"
    ];
  };

  systemd.services.llama-cpp = {
    environment = {
      XDG_CACHE_HOME = "/var/cache/llama-cpp";
    };
    serviceConfig.CacheDirectory = "llama-cpp";
  };
}
