{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/love-yuri/dotfiles";
  is_wsl = true;
in {
  home.username = "yuri";
  home.stateVersion = "25.05";
  _module.args = {
    inherit dotfiles;
    inherit is_wsl;
  };
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
    ./config/config-link.nix
  ];
}
