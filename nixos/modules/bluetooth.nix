{ pkgs, ... }:

{
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  # Can be enabled in case destkop environments does not contain a snippet for bluetooth synchronization
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    overskride
  ];
}
