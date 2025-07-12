{ config, pkgs, ... }:

let
  # 修复qq 确实krb5的问题
  qq_with_krb = pkgs.writeShellScriptBin "qq" ''
    export LD_LIBRARY_PATH=${pkgs.krb5.lib}/lib:$LD_LIBRARY_PATH
    exec ${pkgs.qq}/bin/qq "$@"
  '';
in {
  home.packages = with pkgs; [
    # ------------------------------
    # 系统信息与监控工具
    # ------------------------------
    fastfetch       # 轻量级系统信息工具（替代 neofetch）
    btop            # 资源监控面板（替代 htop）
    eza             # 现代化 ls 替代工具（支持图标和更好排版）
    
    # ------------------------------
    # 终端工具
    # ------------------------------
    nnn             # 终端文件管理器（支持预览和插件）
    zip             # 传统压缩工具
    xz              # 高压缩率工具（常用于内核/软件包压缩）
    unzip           # ZIP 解压工具
    p7zip           # 7z 压缩/解压支持
    lua             # 轻量级脚本语言
    
    # ------------------------------
    # 开发工具链
    # ------------------------------
    # gcc             # GNU 编译器集合（C/C++/Fortran等）
    clang           # clang
    clang-tools     # 包含 clangd（LSP 服务器）、clang-format 等
    cmake           # 跨平台构建工具
    nodejs          # JavaScript 运行时（含 npm/npx）
    gdb             # gdb调试器
    sdl3            # sdl3 库
    spdlog          # spdlog 库

    #python
    (python3.withPackages (ps: with ps; [ 
      requests
      beautifulsoup4 
    ]))

    # ------------------------------
    # 图形界面应用
    # ------------------------------
    google-chrome   # Chromium 浏览器（闭源稳定版）
    qqmusic         # QQ 音乐官方客户端
    qq_with_krb     # QQ 官方客户端
    wechat          # 微信客户端
    vscode          # Visual Studio Code 编辑器

    # ------------------------------
    # Wayland 环境工具
    # ------------------------------
    waybar          # 状态栏（支持自定义模块）
    wofi            # 应用启动器（轻量级替代 rofi）
    swaynotificationcenter  # 通知中心（Sway/Wayland 专用）
    wl-clipboard    # Wayland 剪贴板工具（wl-copy/wl-paste）
    grim            # 屏幕截图工具（Wayland 原生）
    slurp           # 区域选择工具（配合 grim 使用）
    wlogout         # 登出/关机菜单（Wayland 兼容）
    swaylock        # 屏幕锁定
    swayidle        # 空闲管理
    dunst           # 轻量级通知守护进程

    # ------------------------------
    # 主题与字体
    # ------------------------------
    adwaita-icon-theme  # GNOME 默认图标集（GTK 应用兼容）
    font-awesome    # 矢量图标字体（用于状态栏/界面）

    # ------------------------------
    # 其他工具
    # ------------------------------
    cliphist        # 剪贴板历史管理
    cava            # ASCII 音乐频谱可视化
    rofi            # 应用启动器/窗口切换（X11/Wayland 通用）
    krb5            # Kerberos 网络认证协议
    neovim          # 现代化 Vim 编辑器（内置 LSP 支持）
  ];
}
