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
  programs.nix-ld.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # 启动时自动打开蓝牙
    
    # 高级设置（可选）
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        # 自动连接已配对设备
        AutoConnect = true;
      };
    };
  };

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
