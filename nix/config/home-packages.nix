{ config, pkgs, ... }:

{
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
    krb5
    qqmusic
    rofi
    grim
    slurp
    cliphist
    cava
    wl-clipboard
    wlogout
  ];
}
