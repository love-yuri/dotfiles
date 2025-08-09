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
    xdg-desktop-portal-gtk
    hyprpaper
    hyprlock
    hyprpicker
    hypridle
    hyprcursor
    librime-lua
    blueman
    imv
    mpv
    vlc
    unar
    libglvnd
    mesa
    libGL
    android-sdk     # android sdk
  ];

  # obs-studio
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # 需要默认配置的包
  programs.clash-verge.enable = true;
  programs.zsh.enable = true;

  # hyprland
  programs.hyprland = {
    enable = true; 
    withUWSM = true;
    xwayland.enable = true;  # Xwayland 可以禁用。
  }; 

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
