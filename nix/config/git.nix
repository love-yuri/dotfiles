{ config, pkgs, ... }:

{
  # git
  programs.git = {
    enable = true;
    userName = "love-yuri";
    userEmail = "yuri2078170658@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };
}