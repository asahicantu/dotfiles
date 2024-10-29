{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asahi = {
    isNormalUser = true;
    description = "asahi";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
   # shell = pkgs.fish;
    packages = with pkgs; [
      spotify
      discord
      tdesktop
      vscodium
      brave
      vivaldi
      opera
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
