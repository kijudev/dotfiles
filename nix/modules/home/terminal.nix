{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 1.0
      background_blur 0
      font_size 13
      hide_window_decorations yes
      window_border_width 0
      window_padding_width 4 4
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
