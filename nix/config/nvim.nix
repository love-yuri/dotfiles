{ dotfiles, lib, config, ... }:

let
  nvimDotfiles = "${dotfiles}/nvim";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimDotfiles;

  # Optional: Ensure the source directory exists
  home.activation.checkNvimDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -d "${nvimDotfiles}" ]; then
      echo "Warning: nvim配置文件没有找到 at ${nvimDotfiles}"
      echo "符号链接将被创建，但可能无法正常工作."
    fi
  '';
}