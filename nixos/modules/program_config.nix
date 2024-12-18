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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 30d --keep 30";
    flake = "/home/asahi/.config/nix/";
  };

  programs.dconf.enable = true;
  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
  };


#   programs.auto-cpufreq.enable = true;
#   programs.auto-cpufreq.settings = {
#     charger = {
#       governor = "performance";
#       turbo = "auto";
#     };

#     battery = {
#       governor = "powersave";
#       turbo = "never";
#     };
#   };
}