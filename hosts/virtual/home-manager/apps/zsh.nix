{
  #ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" "ssh-agent" "git" ];
      theme = "powerlevel10k";
    };
    initExtra = ''
    [[ ! -f $HOME/nixos/modules/hm/commonfiles/p10k/.p10k.zsh ]] || source $HOME/nixos/modules/hm/commonfiles/p10k/.p10k.zsh
      bindkey '^f' autosuggest-accept
      neofetch
      alias vim="nvim"
      alias ls="eza -la --group-directories-first"
      alias cat="bat"
      alias rm="trash"
    '';
  };
}
