{ config, pkgs, ... }:

{
  imports = [
    ../modules/common.nix
    ../modules/hyprland.nix
  ];
}
