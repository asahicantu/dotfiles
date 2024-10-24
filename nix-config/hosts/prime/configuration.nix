{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/hyprland.nix
    ../modules/common.nix
  ];
  
}
