## llama.cpp with vulkan backend

{ pkgs, inputs, ... }:

{
  services.llama-cpp = {
    enable = true;
    package = inputs.unstable.legacyPackages.${pkgs.system}.llama-cpp;
    settings = {
      host = 127.0.0.1;
      port = 8080;
      models-dir = "var/lib/models";
      ctx-size = 8192;
      n-gpu-layers = 999;
      threads = 4;
      cache-type-k = "q8_0";
      cache-type-v = "q8_0";
    };
  };
}




