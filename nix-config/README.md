# nix-config

Nix config files.

## Installation

1. Download and boot the iso: ()[https://nixos.org/download.html]
2. Make sure you’re connected to the internet (upper right corner for WiFi).  Go through the installer and select "No desktop”, restart when done
3. Make sure you are connected to a network

    ```bash
    sudo NetworkManager
    nmtui
    ```

4. Execute  `sudo nano /etc/nixos/configuration.nix`
5. Add the following line `nix.settings.experimental-features = [ "nix-command" "flakes"];`
6. Rebuild the system by running `sudo nixos-rebuild switch`
7. Enable Home Manager

    ```bash
    nix-shell -p home-manager
    home-manager init
    home-manager switch
    exit
    home-manager switch
    ```

8. Regenerate the .lock files for flakes

   ```bash
    nix flake update ~/.config/home-manager/
    home-manager update
   ```

9. Install the configuration files

    ```bash
    sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos # sets the system channel
    sudo nixos-rebuild switch --upgrade
    nix-channel –add https://nixos.org/channels/nixos-unstable nixos # sets the user channel
    ```

10. Install git by running `nano ~/.config/home-manager/home.nix` and adding the line `programs.git.enable = true;`
11. Run `home-manager switch`
12. Run the preconfigured settings

    ```bash
    cd ~
    git clone https://github.com/asahicantu/nix-config.git
    rm -rf ~/.config
    mv ~/nix-config/.config ~
    rm -rf ~/nix-config
    cp /etc/nixos/hardware-configuration.nix ~/.config/nixos/hardware.nix
    # grep -rl "<user-email>" | xargs -d\\n -n 1 sed -i 's/<user-email>/<your_email>/g'
    # grep -rl "<user-name>" | xargs -d\\n -n 1 sed -i 's/<user-name>/<your_full_name>/g'
    # grep -rl "christian” | xargs -d\\n -n 1 sed -i 's/christian/<your_username>/g'
    cp -r ~/.config/nixos /tmp
    sudo nixos-rebuild switch --flake /tmp/nixos/#default
    rm -rf /tmp/nixos
    home-manager switch -b backup
    ```

13. Install the NixOsConfig

    ```bash
    nixos-up <machine-profile>
    nix-up
    reboot
    ```

13.1 For Nvidia graphis card:

* [](https://nixos.wiki/wiki/Intel_Graphics)
* [](https://nixos.wiki/wiki/Nvidia)

14. Update the flakes

    ```bash
    nix-up flake
    nixos-up <machine_profile> flake
    ```

## Default Keybindings

IMPORTANT: My config uses keyd to swap ALT for META and vice versa.  This means that if you want a program to read ALT, you press META.  My main modifier in Hyprland is set to SUPER (meta), which means that you will press ALT on the physical keyboard.  Henceforth, key names will refer to the PHYSICAL keys on the keyboard:

### Movement

- ALT+1, ALT+2, ..., ALT+N : Go to workspace N
* ALT+SHIFT+1, ALT+SHIFT+2, ..., ALT+SHIFT+N : Move current window to workspace N and follow it
* ALT+I/J/K/L: Focus window up/left/down/right
* ALT+SHIFT+I/J/K/L: Move focused window up/left/down/right

### Essentials

- ALT+D: fuzzel (run launcher)
* ALT+Enter: footclient (terminal)
* ALT+SHIFT+E: wlogout (power menu)

### Extras

- ALT+Z: zen mode toggle (kill waybar, set all gaps to zero, turn off rounding)
* ALT+SHIFT+Q: close focused window
* ALT+E: ranger (text-based file browser)
* ALT+W: firefox (web browser)
* ALT+C: clipboard history
* ALT+O: emoji picker
* ALT+A: pulsemixer (text-based audio control)
* ALT+SHIFT+C: clear clipboard history
* ALT+F: toggle fullscreen focused window
* ALT+P: hyprpicker (color picker)
* ALT+S: screenshot
* ALT+B: btop (task manager)
* ALT+SHIFT+B: cycle wallpaper (background)
