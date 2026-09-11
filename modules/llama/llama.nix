## llama-cpp implementation for laptop

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    llama-cpp-vulkan
  ];

  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    settings = {
      model = "/var/lib/models/Qwen3.6-35B-A3B-UD-IQ4_XS.gguf";
      host = "127.0.0.1";
      port = 8080;
      n-gpu-layers = 99;
      threads = 2;
      ctx-size = 16384;
      flash-attn = "on";
    };
  };
}
