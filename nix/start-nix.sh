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

echo "正在复制 $SCRIPT_DIR 中的文件到 /etc/nixos/"
sudo cp -r "$SCRIPT_DIR"/* /etc/nixos/

if [ $? -eq 0 ]; then
    echo "文件复制成功，开始重新构建 NixOS..."
    sudo nixos-rebuild switch
else
    echo "错误：文件复制失败"
    exit 1
fi