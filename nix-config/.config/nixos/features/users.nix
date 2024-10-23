{ pkgs, ... }:
{
  users.users.asahi = {
    isNormalUser = true;
    description = "Asahi Cantu";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
