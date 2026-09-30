# Auto-load project dev shells (`.envrc` with `use flake`) on cd.
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # caches the shell and keeps it from being GC'd
    silent = true;
  };

  programs.git.ignores = [ ".direnv/" ];
}
