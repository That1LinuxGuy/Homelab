{ inputs, config, pkgs, ... }:

{
  home.packages = [
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];
}
