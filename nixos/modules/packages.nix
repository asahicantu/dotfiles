
{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    gcc
    zig
    unrar
    unzip

    python312
    uv
    nodejs_22
    alsa-ucm-conf
    alsa-utils

    usbutils
    ripgrep

    evtest

    vivaldi
    opera
    firefox
    ungoogled-chromium
    tridactyl-native
    yazi
    wirelesstools
    starship
    atuin
    wineWowPackages.stable
    winetricks
    bottles
    qbittorrent-nox
    nh
    rsync
    magic-wormhole
    nwg-displays
    entr
    brightnessctl

    delta
    difftastic
    diff-so-fancy
    dotnetCorePackages.sdk_9_0

    cargo
    go
    bat
    eza
    fzf
    tmux
    sesh
    kitty
    chezmoi
    zsh
    psmisc

    zoxide
    pavucontrol

    git
    gh
    vscodium
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    warp-terminal
    wget

  ];
}