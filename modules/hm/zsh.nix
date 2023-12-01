{
  #ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "ssh-agent" "git" ];
      theme = "powerlevel10k";
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    initExtra = ''
      bindkey '^f' autosuggest-accept
      neofetch
      alias vim="nvim"
      alias ls="eza -la --group-directories-first"
      alias cat="bat"
      alias rm="trash"
      alias nixgen="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
      alias reload="hyprctl reload"
    '';
  };
}