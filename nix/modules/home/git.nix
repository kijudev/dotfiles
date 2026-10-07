{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kiju";
        email = "dev@jakubkijek.com";
      };

      init.defaultBranch = "main";
    };

    ignores = [ "**/.claude/settings.local.json" ];
  };
}
