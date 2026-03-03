# Shell — Zsh with completions, autosuggestions, syntax highlighting, and oh-my-zsh.
{
  programs.zsh = {
    enable = true;
    history.size = 4096;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
