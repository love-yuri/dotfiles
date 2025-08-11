# hyprland 配置教程

> 以下所有东西都是基于终端页面配置

## 必备软件安装

### hyprland

```
sudo pacman -S git zsh kitty hyprland waybar
```

### 基础安装

> 安装hyprlan waybar  kitty终端 swaybg设置壁纸 wofi 查看应用

```bash
yay -S clash-verge-rev google-chrome visual-studio-code-bin

yay -S rofi-lbonn-wayland-only-git
    wofi rofi dunst thunar wlogout grim slurp pamixer cliphist wl-clipboard \ # wayland 工具
    fastfetch cava btop eza  \
    hyprlock hyprpaper hyprpicker hypridle hyprcursor hyprpolkitagent \ # hypr 全家桶
```

### 字体安装

```
sudo pacman -S ttf-fira-code nerd-fonts-complete 
```

### gtk主题安装

```
yay -S lxappearance xfce4-settings dracula-gtk-theme dracula-icons-git    
```

## 常用字体

```bash
yay -S otf-font-awesome noto-fonts-emoji ttf-maplemono-nf-cn-unhinted
```

## 输入法

```bash
yay -S fcitx5 fcitx5-rime fcitx5-configtool
```

### 语言提示

```
python : sudo pacman -S python-neovim
c++ : sudo pacman -S neovim-coc-clangd-git ccls-git clang 
java : CocInstall coc-java

#创建workspace目录，后面会用到
mkdir -p ~/.local/share/nvim/lsp/jdt-language-server/workspace/folder
cd ~/.local/share/nvim/lsp/jdt-language-server
# 下载jdt-language-server-xxxxx.tar.gz
wget https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz
# 解压
tar -zxvf jdt-language-server-1.9.0-202203031534.tar.gz
```

### 移除neovim

```bash
sudo pacman -Rs neovim
rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
rm -rf ~/.cache/nvim/
rm -rf ~/.lua
```

## zsh

```
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions
chsh -l # 查看安装了哪些 Shell
chsh -s /usr/bin/zsh # 修改当前账户的默认 Shell

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
vim ~/.zshrc
zmodule romkatv/powerlevel10k
zimfw install
sudo pacman -S ttf-jetbrains-mono-nerd

```

## 剪贴板

```bash
 for i in $(cliphist list | awk -F. '{ print $2 }'); do cliphist delete-query "$i"; done
```

## 常用仓库

- 光标主题: `git clone https://gitlab.com/Pummelfisch/future-cyan-hyprcursor.git`
- 拼音词库: `git clone --depth 1 https://github.com/gaboolic/rime-frost  ~/.local/share/fcitx5/rime`
- fcitx5 主题: `git clone https://github.com/witt-bit/fcitx5-theme-ayaya`

## 常用软件

1. `btop` 显示系统进程
2. `pavucontrol` 控制音频输出
3. `dunst` 通知守护进程
4. `cava` 音乐可视化工具
5. `thunar` 轻量级文件管理工具
6. `swaybg` 设置壁纸工具
7. `swaylock` 锁屏工具
8. `wofi` 显示应用工具
9. `polkit-gnome` 用户授权工具 `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1`
10. `python-requests`：一个用于发送 HTTP 请求的 Python 第三方库。
11. `starship`：一个跨平台的、自定义命令行提示符的工具，可以为 shell 提供美观的界面和丰富的特性。
12. `swappy`：一个用于切换 Wallpapers 的 GTK3 图形界面程序，支持多显示器和多环境。
13. `grim`：一个用于截图的 Wayland 应用程序，支持向剪贴板、文件和标准输出（stdout）输出截图。
14. `slurp`：一个用于捕获选取的区域并返回位置和尺寸信息的小程序，通常会在截图脚本中使用。与 grim 配合使用可以实现高效的屏幕截图。
15. `pamixer`：一个可以与 PulseAudio 音频管理器集成的命令行音量控制工具，可以用来在终端中控制系统音量。
16. `brightnessctl`：一个用于在 Linux 系统中调节屏幕亮度的命令行工具，支持多种方式调节（如 Backlight、sysfs 等）。
17. `gvfs`：一个虚拟文件系统（Virtual File System）实现，用于访问各种文件系统和设备，包括本地文件、HTTP、FTP、以及网络分享文件系统等。
18. `bluez`：一个用于管理蓝牙设备的代理和摘要库。用于 Linux 蓝牙堆栈的协议栈及应用。
19. `bluez-utils`：一个提供了用于蓝牙设备管理和调试的实用工具与小程序的软件包。
20. `lxappearance`：通常用于在 LXDE 和 Openbox 环境中配置 GTK+ 主题和图标，设置窗口装饰器和鼠标光标等参数。
21. `xfce4-settings`：Xfce 桌面环境的设置工具，用于配置主题、声音、键盘快捷键、鼠标等各个方面的设置。
22. `dracula-gtk-theme`：一款针对 GTK+ 应用程序的暗色主题，能够提供清晰、高对比度、明显的视觉提示。
23. `dracula-icons-git`：在 Dracula 主题基础上，提供一些额外的针对特定应用的图标。通常用于与 Dracula GTK 主题搭配使用。
24. `xdg-desktop-portal-hyprland-git`：一个用于在应用程序之间共享文件、多媒体和其他资源的工具，依靠 Flatpak 和 Wayland 协议来工作。
