{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # 监视器配置
      monitor = [
        ",2560x1440@180,auto,1"
      ];

      # 程序变量
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";
      "$mainMod" = "SUPER";

      # 自启动程序
      exec-once = [
        "waybar"
        "dunst --title dunst"
        "fcitx5 --replace -d"
        "clash-verge &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # 环境变量
      env = [
        "XCURSOR_SIZE,21"
        "HYPRCURSOR_SIZE,21"
        "GDK_SCALE,1"
        "XCURSOR_SIZE,22"
        "XMODIFIERS,@im=fcitx"
        "QT_IM_MODULE,fcitx"
        "SDL_IM_MODULE,fcitx"
        "GDK_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "CLUTTER_BACKEND,wayland"
        "ADW_DISABLE_PORTAL,1"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Dracula-cursors"
        "HYPRCURSOR_THEME,hyprcursor_Dracula"
        "HYPRCURSOR_SIZE,24"
        "LANGUAGE,zh_CN:en_US"
        "GDK_SCALE,1"
        "XCURSOR_SIZE,32"
        "GDK_BACKEND=x11 qqmusic"
      ];

      # 通用设置
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "0xfff5c2e7";
        "col.inactive_border" = "0x66333333";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # 装饰设置
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # 动画设置
      animations = {
        enabled = true;
        
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "myBezier_2, 0.13,0.99,0.29,1.1"
        ];

        animation = [
          "windows, 1, 5.6, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 9.9, myBezier_2, slide"
        ];
      };

      # Dwindle 布局
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master 布局
      master = {
        new_status = "master";
      };

      # 杂项设置
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # 输入设置
      input = {
        kb_options = "caps:escape";
        repeat_rate = 50;
        repeat_delay = 240;

        touchpad = {
          disable_while_typing = 1;
          natural_scroll = 1;
          clickfinger_behavior = 1;
          middle_button_emulation = 0;
          tap-to-click = 1;
        };
      };

      # 手势设置
      gestures = {
        workspace_swipe = false;
      };

      # 设备特定配置
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # XWayland 设置
      xwayland = {
        force_zero_scaling = true;
      };

      # 键位绑定
      bind = [
        # 基本程序启动
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "ALT, space, exec, rofi -show drun"

        # 焦点移动
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # 工作区切换
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # 移动窗口到工作区
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # 特殊工作区
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "SUPERSHIFT, C, exit,"

        # 鼠标滚轮工作区切换
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # 应用程序快捷键
        "ALT, 1, exec, code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
        "ALT, 2, exec, google-chrome-stable"
        "ALT, 3, exec, Typora"
        "ALT, 4, exec, netease-cloud-music"
        "ALT, 5, exec, linuxqq"
      ];

      # 鼠标绑定
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # 音量和亮度控制 (bindel: 可重复触发 + 锁屏时生效)
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"  # 音量增加键 (通常是F3或专用音量+键)
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"        # 音量减少键 (通常是F2或专用音量-键)
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"             # 静音切换键 (通常是F1或专用静音键)
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"        # 麦克风静音切换键
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"                   # 亮度增加键 (通常是F6或专用亮度+键)
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"                 # 亮度减少键 (通常是F5或专用亮度-键)
      ];

      # 媒体控制 (bindl: 单次触发 + 锁屏时生效)
      bindl = [
        ",XF86AudioNext, exec, playerctl next"        # 下一首 (通常是F9或专用下一首键)
        ",XF86AudioPause, exec, playerctl play-pause" # 暂停键
        ",XF86AudioPlay, exec, playerctl play-pause"  # 播放键
        ",XF86AudioPrev, exec, playerctl previous"    # 上一首 (通常是F7或专用上一首键)
      ];

      # 窗口规则
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "center,title:^(fly_is_kitty)$"
        "size 60% 40%,title:^(fly_is_kitty)$"
        "float,title:^(fly_is_kitty)$"
        "tile,title:^(WPS)(.*)$"
        "float,title:^(Open File)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$"
        "nofocus,title:^(.*)(mvi)$"
      ];

      # 窗口规则 v2
      windowrulev2 = [
        "float, class:clash-verge"
        "size 70% 70%, class:clash-verge"
        "center, class:clash-verge"
        "float, class:netease-cloud-music"
        "center, class:^(class:netease-cloud-music)$"
        "size 70% 70%,, class:^(class:netease-cloud-music)$"
        "float, class:yesplaymusic"
        "size 70% 70%, class:yesplaymusic"
        "center, class:yesplaymusic"
        "float, title:yuri"
        "tile, class:wps"
        "tile, class:wpspdf"
        "tile, class:pdf"
        "tile, class:wpp"
        "float, title:^(Ark)$"
        "float, class:^(Ark)$"
        "float, title:rofi.*"
        "float, class:xyz.chatboxapp.app"
        "opacity 0.8 override 0.8 override, class:^(kitty)$"
        "opacity 0.91 override 0.91 override, class:^(Code)$"
        "opacity 0.9 override 0.9 override, class:^(Typora)$"
        "float, class:^(.*fcitx.*)$"
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 1.0 override 1.0 override, class:^(Google-chrome)$"
        "opacity 0.9 override 0.9 override, class:^(QQ)$"
        "float, class:^(QQ)$"
        "float, class:^(kruler)$"
        "float,title:^(查看媒体)$|^(图片查看)$|^(图片查看器)$|^(KDE)$"
        "float,title:^(预览)$"
        "float, class:^(yuri)$"
        "float, class:^(feishu)$"
        "size 75% 75%, class:^(QQ)$"
        "center, class:^(QQ)$"
        "size 75% 75%, class:^(Thunar)$"
        "center, class:^(Thunar)$"
      ];
    };
  };
}