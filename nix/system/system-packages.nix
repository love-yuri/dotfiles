{ config, lib, pkgs, ... }:

# 负责处理系统级别的包

{
  # 包
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    curl
    kitty
    dig
    pamixer
  ];

  # 需要默认配置的包
  programs.hyprland.enable = true;
  programs.clash-verge.enable = true;
  programs.zsh.enable = true;

  # 音频配置
  services.pipewire = {
    enable = true;
    pulse.enable = true;  # 启用 PulseAudio 兼容层
    alsa.enable = true;   # 可选：ALSA 支持
  };

  # docker
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      "registry-mirrors" = [
        "https://hub-mirror.c.163.com"
        "https://mirror.baidubce.com"
        "https://docker.mirrors.ustc.edu.cn"
      ];
    };
  };
}
