{
  description = "Flake for my NixOS configuration";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm.url = "github:wez/wezterm?dir=nix";

  };

  outputs = { self, nixpkgs, auto-cpufreq, home-manager,  ... }@inputs:
    let

      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [];
      };

    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
           inherit system;  
           specialArgs = { inherit inputs; };
	   modules = [
               ./configuration.nix
               ./hardware-configuration.nix
               ./modules/bootloader.nix
	       ./modules/network.nix
               ./modules/bluetooth.nix
	       ./modules/fonts.nix
	       ./modules/theme.nix
               ./modules/users.nix
	       ./modules/nvidia.nix
               #./modules/gnome.nix
	       ./modules/hyprland.nix
               ./modules/services.nix
		./modules/packages.nix
               auto-cpufreq.nixosModules.default
             ];
        };
    };
}
