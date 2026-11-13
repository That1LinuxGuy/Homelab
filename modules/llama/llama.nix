## stable-diffusion.cpp image generation server with Vulkan GPU support

{ ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers.stable-diffusion = {
      image = "ghcr.io/leejet/stable-diffusion.cpp:master-vulkan";
      extraOptions = [
        "--device=/dev/dri"
        "--group-add=keep-groups"
        "--init"
        "--entrypoint=/sd-server"
      ];

      volumes = [
        "/var/lib/models/flux:/models:ro"
      ];
      ports = [ "127.0.0.1:1234:1234" ];
      cmd = [
        "--model-dir" "/models"
        "--listen-ip" "0.0.0.0"
        "--listen-port" "1234"
      ];
    };
  };
}
