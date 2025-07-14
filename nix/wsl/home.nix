{ config, pkgs, ... }:

{
  home.username = "yuri";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    fastfetch
    nnn
    zip
    xz
    unzip
    p7zip
    btop
    gcc
    nodejs
    eza
    lua
  ];

  imports = [
    ./config/git.nix
    ./config/zsh.nix
  ];
}
