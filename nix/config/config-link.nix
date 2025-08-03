{ dotfiles, lib, config, ... }:

let
  linkConfigs = {
    "nvim" = "${dotfiles}/nvim";
    "mimeapps.list" = "${dotfiles}/mimeapps.list";     
    "hypr" = "${dotfiles}/hypr";
  };

  # 直接创建链接，并打印信息
  generatedLinks = lib.mapAttrs (name: source:
    builtins.trace "创建符号链接: ${name} -> ${source}" {
      source = config.lib.file.mkOutOfStoreSymlink source;
    }
  ) linkConfigs;

in {
  xdg.configFile = generatedLinks;
}