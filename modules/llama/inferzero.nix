{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.services.inferzero;
  inferzero = inputs.inferzero-nix.packages.${pkgs.system}.default;
  modelArg = lib.escapeShellArg (toString cfg.model);
  extraArgs = lib.escapeShellArgs cfg.extraArgs;
in
{
  options.services.inferzero = {
    enable = lib.mkEnableOption "the inferzero LLM server";

    model = lib.mkOption {
      type = lib.types.path;
      default = /var/lib/inferzero/models/qwen3.5-4b.gguf;
      description = "Model file served by inferzero.";
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 8090;
      description = "Port on which inferzero listens.";
    };

    extraArgs = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional arguments passed to serverz.";
      example = [ "--ctx" "auto" "--mtp" ];
    };
  };

  config = lib.mkIf cfg.enable {
    users.groups.inferzero = { };

    users.users.inferzero = {
      isSystemUser = true;
      group = "inferzero";
      extraGroups = [ "render" ];
    };

    systemd.services.inferzero = {
      description = "inferzero LLM server";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      serviceConfig = {
        User = "inferzero";
        Group = "inferzero";
        StateDirectory = "inferzero";
        Environment = "HOME=/var/lib/inferzero";
        ExecStart = "${inferzero}/bin/serverz --model ${modelArg} --port ${toString cfg.port} ${extraArgs}";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
