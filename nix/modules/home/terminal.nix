{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  # Render a base16 scheme through the same tinted-kitty template Stylix uses.
  # The template maps color8 (bright black, used for autosuggestions and dim
  # text) to base02, which is nearly invisible; use base03 instead.
  kittyTheme =
    name: colors:
    pkgs.runCommand "kitty-${name}.conf" { } ''
      cat ${
        colors {
          templateRepo = inputs.stylix.inputs.tinted-kitty;
          target = "base16";
        }
      } > $out
      echo "color8 #${colors.base03}" >> $out
    '';

  # Light counterpart of the Stylix palette: same warm greys, inverted ramp,
  # accents darkened so they stay readable on a light background.
  lightScheme = {
    scheme = "Kiju Light";
    author = "kiju";
    base00 = "f4f1ed";
    base01 = "e9e5e0";
    base02 = "dcd6cf";
    base03 = "958b82";
    base04 = "7a7067";
    base05 = "221e1b";
    base06 = "171513";
    base07 = "0d0c0b";

    base08 = "65584c";
    base09 = "5a5047";
    base0A = "4a433c";
    base0B = "6b5c4d";
    base0C = "736352";
    base0D = "574e45";
    base0E = "806d5a";
    base0F = "433d37";
  };
in
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 1
      background_blur 32
      font_size 12
      hide_window_decorations yes
      window_border_width 0
      window_padding_width 4 4
      draw_minimal_borders yes

      # Live theme switching via `kitty-theme`.
      allow_remote_control socket-only
      listen_on unix:''${XDG_RUNTIME_DIR}/kitty

      # Mutable symlink managed by `kitty-theme`; overrides the Stylix colors.
      globinclude current-theme.conf
    '';
  };

  xdg.configFile = {
    "kitty/themes/dark.conf".source = kittyTheme "dark" config.lib.stylix.colors;
    "kitty/themes/light.conf".source = kittyTheme "light" (config.stylix.base16.mkSchemeAttrs lightScheme);
  };

  # Default to dark on first activation; afterwards the choice is left alone.
  home.activation.kittyTheme = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    kitty_dir="${config.xdg.configHome}/kitty"
    if [ ! -e "$kitty_dir/current-theme.conf" ]; then
      run ln -sfn themes/dark.conf "$kitty_dir/current-theme.conf"
    fi
  '';

  home.packages = [
    (pkgs.writeShellScriptBin "kitty-theme" ''
      set -eu
      dir="''${XDG_CONFIG_HOME:-$HOME/.config}/kitty"
      current=$(basename "$(readlink "$dir/current-theme.conf" 2>/dev/null)" .conf || true)

      case "''${1:-toggle}" in
        dark | light) theme=$1 ;;
        toggle) [ "$current" = light ] && theme=dark || theme=light ;;
        *)
          echo "usage: kitty-theme [dark|light|toggle]" >&2
          exit 1
          ;;
      esac

      ln -sfn "themes/$theme.conf" "$dir/current-theme.conf"

      # Recolor every running kitty instance.
      for sock in "$XDG_RUNTIME_DIR"/kitty-*; do
        [ -S "$sock" ] || continue
        ${pkgs.kitty}/bin/kitty @ --to "unix:$sock" set-colors --all --configured "$dir/current-theme.conf" || true
      done

      echo "kitty theme: $theme"
    '')
  ];

  programs.zellij = {
    enable = true;
    settings = {
      pane-frames = true;
      simplified_ui = true;
      default_layout = "compact";
    };
  };
}
