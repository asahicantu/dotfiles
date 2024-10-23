{ config, pkgs, ... }:
{
  ## Program configurations

   # Configuring Git
  programs.git = {
    enable = true;
    package = pkgs.git;

    config = {
      user = {
        name = "Asahi Cantu";
        email = "asahicantu@outlook.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.dconf.enable = true;


# Install firefox.
  programs.firefox.enable = true;

  
    # Hyprland
    programs.hyprland.enable = true;


    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    };
}