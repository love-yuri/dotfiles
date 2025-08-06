#!/usr/bin/env bash

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 检查目录是否存在
if [ ! -d "$SCRIPT_DIR" ]; then
    echo "错误：无法确定脚本目录"
    exit 1
fi

# 检查是否有文件要复制
if [ ! "$(ls -A "$SCRIPT_DIR")" ]; then
    echo "警告：脚本目录为空"
    exit 1
fi

if grep -qi "microsoft" /proc/sys/kernel/osrelease; then
    USE_WSL=true
else
    USE_WSL=false
fi

# 开始复制
echo "正在复制 $SCRIPT_DIR 中的文件到 /etc/nixos/"
sudo cp -r "$SCRIPT_DIR"/* /etc/nixos/

if [ $? -ne 0 ]; then
    echo "错误：文件复制失败"
    exit 1
fi

# 如果使用 WSL 模式，替换配置文件
if $USE_WSL; then
    echo "检测到 wsl，使用 WSL 配置文件替换默认配置..."

    WSL_DIR="$SCRIPT_DIR/wsl"
    if [ ! -d "$WSL_DIR" ]; then
        echo "错误：未找到 wsl 子目录"
        exit 1
    fi

    for file in configuration.nix home.nix flake.nix; do
        if [ -f "$WSL_DIR/$file" ]; then
            echo "替换 $file ..."
            sudo cp "$WSL_DIR/$file" /etc/nixos/
        else
            echo "警告：$file 不存在于 wsl 子目录中，跳过替换"
        fi
    done
fi

echo "文件复制完成，开始重新构建 NixOS..."
sudo nixos-rebuild switch
