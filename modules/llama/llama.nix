## OpenVINO Model Server with GPU support

{ ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers.ovms = {
      image = "openvino/model_server:latest-gpu";
      extraOptions = [
        "--device=/dev/dri"
        "--device=/dev/accel"
        "--group-add=keep-groups"
      ];

      environment = {
        "OV_COMPILATION_NUM_THREADS" = "1";
      };

      volumes = [
        "/var/lib/models/qwen:/models:ro"
        "/var/lib/ovms-npu:/cache"
      ];
      ports = [
        "127.0.0.1:8080:8080" 
        "127.0.0.1:9000:9000"
      ];
      cmd = [
        "--model_path" "/models"
        "--cache_dir" "/cache"
        "--model_name" "qwen"
        "--target_device" "NPU"
        "--port" "8080"
        "--rest_port" "9000"
        "--max_prompt_len" "8192"
      ];
    };
  };
}
