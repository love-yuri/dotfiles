{ config, pkgs, ... }:

# 配置语言，输入法，字体相关的东西

{
  time.timeZone = "Asia/Shanghai"; # 设置时区
  i18n.defaultLocale = "zh_CN.UTF-8";  
  i18n.supportedLocales = ["zh_CN.UTF-8/UTF-8" "zh_TW.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      # fcitx5-chinese-addons  # 拼音/双拼
      fcitx5-rime
      fcitx5-pinyin-zhwiki   # 维基词库
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
  ];

  # 字体优先级配置
  fonts.fontconfig = {
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Noto Sans Mono CJK SC"
        "Sarasa Mono SC"
        "DejaVu Sans Mono"
      ];
      sansSerif = [
        "Noto Sans CJK SC"
        "Source Han Sans SC"
        "DejaVu Sans"
      ];
      serif = [
        "Noto Serif CJK SC"
        "Source Han Serif SC"
        "DejaVu Serif"
      ];
    };
  };
}
