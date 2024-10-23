{
  description = "Flake for my NixOS configuration";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, auto-cpufreq, ... }@inputs: {
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        auto-cpufreq.nixosModules.default
      ];
    };
  };
}