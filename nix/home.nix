{ config, pkgs, nixpkgs-unstable, ... }:

let 
  dotfiles = "${config.home.homeDirectory}/love-yuri/dotfiles";
  is_wsl = false;
in {
  home.username = "yuri";
  home.stateVersion = "25.05";
  _module.args = {
    inherit dotfiles;
    inherit is_wsl;
  };

  imports = [
    ./config/git.nix
    ./config/zsh.nix
    ./config/home-packages.nix
    ./config/config-link.nix
  ];
}
