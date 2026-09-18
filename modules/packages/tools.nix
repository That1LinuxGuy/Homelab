## List of helpful tools for laptops

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    localsend
    photoqt
    switcheroo
    yazi
    zoom-us
    mdcat

    # Hugging Face
    python313Packages.huggingface-hub
  ];
}
