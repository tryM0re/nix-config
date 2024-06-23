{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "kubectl"
        "ssh-agent"
      ];
      extraConfig = "zstyle :omz:plugins:ssh-agent identities gitlab github_kitty";
    };
  };
}
