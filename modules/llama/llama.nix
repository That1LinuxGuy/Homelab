## llama.cpp OpenVINO OCI container

{ ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers.llama-openvino = {
      image = "ghcr.io/ggml-org/llama.cpp:server-openvino";
      extraOptions = [ "--device=/dev/dri" ];
      volumes = [ "/var/lib/models:/models:ro" ];
      ports = [ "8080:8080" ];
      environment = {
        GGML_OPENVINO_DEVICE = "GPU";
      };
      cmd = [
        "--host" "127.0.0.1"
        "--port" "8080"
        "-ngl" "999"
        "-t" "4"
        "-c" "32768"
        "-ctk" "q8_0"
        "-ctv" "q8_0"
        "-b" "512"
        "-ub" "64"
        "--jinja"
        "--models-dir" "/models"
        "--reasoning-budget" "-1"
      ];
    };
  };
}
