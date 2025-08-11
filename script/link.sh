#!/bin/bash

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

DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$HOME/.config"

# 要创建的符号链接列表
links=(
  "hypr"
  "kitty"
  "rofi"
  "wofi"
  "cava"
  "nvim"
  "btop"
  "dunst"
)

# 检查是否有已存在的链接
existing_links=()
for link in "${links[@]}"; do
  if [ -e "$CONFIG_DIR/$link" ]; then
    existing_links+=("$link")
  fi
done

# 如果存在已链接的项目，询问一次是否全部覆盖
if [ ${#existing_links[@]} -gt 0 ]; then
  echo "以下配置已存在: ${existing_links[*]}"
  read -p "是否删除并重新创建所有已存在的链接？(y/n): " choice
  case "$choice" in
    y|Y)
      overwrite_all=true
      ;;
    *)
      overwrite_all=false
      ;;
  esac
else
  overwrite_all=true
fi


# 创建符号链接的函数
create_symlink() {
  local source="$DOTFILES_DIR/$1"
  local target="$CONFIG_DIR/$1"
  
  # 检查目标是否已存在
  if [ -e "$target" ]; then
    if [ "$overwrite_all" = false ]; then
      echo "跳过 $target"
      return
    fi
    echo "删除 $target..."
    rm -rf "$target"
  fi
  
  # 创建符号链接
  echo "创建链接: $target -> $source"
  ln -s "$source" "$target"
}

# 为每个项目创建链接
for link in "${links[@]}"; do
  create_symlink "$link"
done

echo "符号链接创建完成！"