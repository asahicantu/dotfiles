# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asahi = {
    isNormalUser = true;
    description = "Asahi Cantu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };
