{ config, pkgs, dotfiles, is_wsl, ... }:
let 
  build_script_path = "${dotfiles}/nix/start-nix.sh";
  wsl_flag = if is_wsl then "--wsl" else "";  # 使用 Nix 的条件表达式
in {
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
      ll="exa -l --git --icons --color=auto";
      buildsystem="${build_script_path}";
      la="exa -a --icons --color=auto";
    };

    # antidote = {
    #   enable = true;
    #   plugins = [''
    #     zsh-users/zsh-autosuggestions
    #     zsh-users/zsh-autosuggestions
    #     romkatv/powerlevel10k
    #     zsh-users/zsh-syntax-highlighting
    #   ''];
    # };

    initContent = ''
      setopt extendedglob
      setopt globstarshort
      setopt autopushd
      setopt correct
      source "$HOME/.zgenom/zgenom.zsh"
      if ! zgenom saved; then
        zgenom load zsh-users/zsh-completions
        zgenom load zsh-users/zsh-syntax-highlighting
        zgenom load zsh-users/zsh-autosuggestions
        zgenom load romkatv/powerlevel10k powerlevel10k
        zgenom save
      fi
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';
  };
}