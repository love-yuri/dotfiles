{ config, pkgs, ... }:

{
  # 启用zsh
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";  # 自动添加密钥到 Agent
  };

  # 路径高亮
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;  # 仅对 Zsh 生效
  };

  # zsh
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };
    shellAliases = {
      ls="exa --icons --color=auto";
      ll="exa -l --icons --color=auto";
      la="exa -a --icons --color=auto";
    };

    # zimfw
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # 记录补全
        { name = "zsh-users/zsh-syntax-highlighting"; } # 语法高亮
	      { name = "zsh-users/zsh-completions"; } # 增强命令补全
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
      ];
    };

    initContent = ''
      setopt extendedglob
      setopt globstarshort
      setopt autopushd
      setopt correct
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';
  };
}