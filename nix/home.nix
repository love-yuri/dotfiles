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
    google-chrome
    waybar
    wofi
    neovim
    wechat
    vscode
    fastfetch
    swaynotificationcenter
    adwaita-icon-theme
    font-awesome
    qq
  ];

  imports = [
    ./config/git.nix
    ./config/zsh.nix
  ];
}
