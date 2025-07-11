{ config, pkgs, ... }:

# 诶之用户相关

{
  users.users.yuri = {
    isNormalUser = true;  # 创建普通用户
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$bhrCGy/jAemvhyfJ$pmMcnKcMQVfUw8G2zHCSbMFxv5k3xqbeVaJ36jY3YeBj/Nbx45IVtSHRaRU2afeY0gwcAe4M6jZfrL4HLbLr61";
    shell = pkgs.zsh; # 默认shell
  };
}