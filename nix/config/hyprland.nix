{ dotfiles, lib, config, ... }:

let
  # Define the source directory for your Hyprland configuration
  hyprlandDotfiles = "${dotfiles}/hypr";
in
{
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprlandDotfiles;

  # Optional: Ensure the source directory exists
  home.activation.checkHyprlandDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -d "${hyprlandDotfiles}" ]; then
      echo "Warning: hyprland配置文件没有找到 at ${hyprlandDotfiles}"
      echo "符号链接将被创建，但可能无法正常工作."
    fi
  '';
}