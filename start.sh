#!/bin/sh

cd ~
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=qt5ct
export SDL_VIDEODRIVER=wayland
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export _JAVA_AWT_WM_NONEREPARENTING=1
export GDK_BACKEND="wayland,x11"
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export HYPRLAND_LOG_WLR=1
export XCURSOR_THEME=Bibata-Modern-Classic
export XCURSOR_SIZE=24
#export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
exec Hyprland
