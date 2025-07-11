{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "yuri";

  # 系统配置
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # 启用flakes
  networking.hostName = "yuri"; # 设置主机名
  time.timeZone = "Asia/Shanghai"; # 设置时区
  nixpkgs.config.allowUnfree = true; # 允许不开源软件
  programs.nix-ld.enable = true; # 允许ld链接

  programs.zsh.enable = true;
  users.users.yuri = {
    isNormalUser = true;  # 创建普通用户
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$bhrCGy/jAemvhyfJ$pmMcnKcMQVfUw8G2zHCSbMFxv5k3xqbeVaJ36jY3YeBj/Nbx45IVtSHRaRU2afeY0gwcAe4M6jZfrL4HLbLr61";
    shell = pkgs.zsh; # 默认shell
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
  
  environment.systemPackages = with pkgs; [
    neovim
    git
    btop
    zimfw
    wget
  ];
}
