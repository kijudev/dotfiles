# Git — user identity, default branch, and global config.
{
  programs.git = {
    enable = true;
    userName = "Kiju";
    userEmail = "dev@jakubkijek.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
