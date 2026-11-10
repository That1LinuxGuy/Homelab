## List of emulators for gaming

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    retroarch-free
    pcxs2
  ];
}
