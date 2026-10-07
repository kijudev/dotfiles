{ pkgs, lib, ... }:
let
  # Yazi's built-in Nerd Font icon set with the per-icon `fg` colors stripped,
  # so each icon inherits the filename's color (Stylix filetype rules).
  # mkForce: Stylix ships its own colored `dirs`/`conds` icons.
  preset = lib.importTOML "${pkgs.yazi-unwrapped.srcs.code_src}/yazi-config/preset/theme-dark.toml";
  monochrome = map (rule: removeAttrs rule [ "fg" ]);
in
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    theme.icon = lib.mkForce (
      lib.genAttrs [ "globs" "dirs" "files" "exts" "conds" ] (kind: monochrome preset.icon.${kind})
    );
  };
}
