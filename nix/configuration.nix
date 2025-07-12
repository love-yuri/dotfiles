{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/language.nix
    ./system/system-packages.nix
    ./system/users.nix
  ];

  system.stateVersion = "25.05";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true; 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking = {
    hostName = "yuri"; # 主机名
    hosts = {
      "140.82.114.4" = ["github.com"];
    };
    nameservers = [ "223.5.5.5" "119.29.29.29" ];  # 阿里 + 腾讯 DNS
  };

  nix.settings = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
}
