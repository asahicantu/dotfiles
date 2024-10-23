{ config, pkgs, ... }:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asahi = {
    isNormalUser = true;
    description = "asahi";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

}

