# Terminal emulator and multiplexer — Kitty with custom appearance settings, and Zellij with compact layout.
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 1
      background_blur 1
      font_size 14
      hide_window_decorations yes
      window_border_width 0
      window_padding_width 4 8
      draw_minimal_borders yes
    '';
  };

  programs.zellij = {
    enable = true;
    settings = {
      pane-frames = true;
      simplified_ui = true;
      default_layout = "compact";
    };
  };
}
