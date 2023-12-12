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
    initExtra = ''
    [[ ! -f $HOME/nixos/modules/hm/commonfiles/p10k/.p10k.zsh ]] || source $HOME/nixos/modules/hm/commonfiles/p10k/.p10k.zsh
    
      bindkey '^f' autosuggest-accept
      neofetch
      alias vim="nvim"
      alias ls="eza -la --group-directories-first"
      alias cat="bat"
      alias rm="trash"
      alias nixgen="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
      alias reload="hyprctl reload"
      alias aliases="cat $HOME/nixos/modules/hm/zsh.nix"
      alias tsup="sudo tailscale up"
      alias tsdn="sudo tailscale down"
      alias tsstat="tailscale status"
    '';
  };
}
