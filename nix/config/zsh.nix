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

    antidote = {
      enable = true;
      plugins = [''
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-autosuggestions
        romkatv/powerlevel10k
        zsh-users/zsh-syntax-highlighting
      ''];
    };

    initContent = ''
      setopt extendedglob
      setopt globstarshort
      setopt autopushd
      setopt correct
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}