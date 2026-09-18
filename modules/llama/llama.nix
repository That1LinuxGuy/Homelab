## llama.cpp Intel/SYCL router server for local GGUF models

{ ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers.llama = {
      image = "ghcr.io/ggml-org/llama.cpp:server-intel";
      extraOptions = [
        "--device=/dev/dri"
        "--group-add=keep-groups"
      ];
      volumes = [ "/var/lib/models:/models:ro" ];
      ports = [ "8080:8080" ];

      cmd = [
        "--host" "0.0.0.0"
        "--port" "8080"
        "--models-dir" "/models"
        "--ctx-size" "16483"
        "--n-gpu-layers" "999"
        "-t" "4"
      ];
    };
  };
}
