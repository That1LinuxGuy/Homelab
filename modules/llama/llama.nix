## OpenVINO Model Server with GPU support

{ ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers.ovms = {
      image = "openvino/model_server:latest-gpu";
      extraOptions = [
        "--device=/dev/dri"
        "--group-add=keep-groups"
      ];

      environment = {
        "OV_COMPILATION_NUM_THREADS" = "1";
      };

      volumes = [
        "/var/lib/models/gemma:/models:ro"
        "/var/lib/ovms:/cache"
      ];
      ports = [ "127.0.0.1:8080:8080" ];
      cmd = [
        "--model_path" "/models"
        "--cache_dir" "/cache"
        "--model_name" "gemma"
        "--plugin_config" ''{"PERFORMANCE_HINT": "LATENCY"}''
        "--port" "8080"
      ];
    };
  };
}
