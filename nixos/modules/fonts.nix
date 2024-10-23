{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk
      font-awesome
      symbola
      material-icons
      cozette
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}