{ config, pkgs, ... }:

{
  home.username = "yuri";
  home.stateVersion = "25.05";

  imports = [
    ./config/git.nix
    ./config/zsh.nix
    ./config/hyprland.nix
    ./config/home-packages.nix
  ];
}
