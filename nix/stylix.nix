{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    polarity = "dark";
    # base16Scheme = {
    #   base00 = "#000000";
    #   base01 = "#282828";
    #   base02 = "#585858";
    #   base03 = "#888888";
    #   base04 = "#c8c8c8";
    #   base05 = "#ffffff";
    #   base06 = "#ffffff";
    #   base07 = "#ffffff";
    #   base08 = "#fa7883";
    #   base09 = "#ffc387";
    #   base0A = "#ff9470";
    #   base0B = "#98c379";
    #   base0C = "#8af5ff";
    #   base0D = "#6bb8ff";
    #   base0E = "#e799ff";
    #   base0F = "#b3684f";
    # };

    base16Scheme = {
      # Base Colors (Neutrals - Kept as requested)
      base00 = "#000000"; # Background (Pure Black)
      base01 = "#282828"; # Lighter Background (Dark Gray)
      base02 = "#585858"; # Darker Foreground (Medium Gray)
      base03 = "#888888"; # Commentary / Faded (Light Gray)
      base04 = "#c8c8c8"; # Foreground dim (Lighter Gray)
      base05 = "#ffffff"; # Foreground (Pure White)
      base06 = "#ffffff"; # Highlighting 1
      base07 = "#ffffff"; # Highlighting 2

      # Accent Colors (Warmer Tones)
      base08 = "#ff6a5f"; # Red (Warm, rich red)
      base09 = "#ff9966"; # Orange (Bright, classic orange)
      base0A = "#ffc83d"; # Yellow / Gold (Rich, deep yellow)
      base0B = "#a9bc74"; # Green (Olive/Warm-Green tone)
      base0C = "#c18c5e"; # Cyan (Earth-tone, Copper/Bronze)
      base0D = "#ddb35e"; # Blue (A warm, golden-brown)
      base0E = "#ff857a"; # Magenta (Warm pink/coral)
      base0F = "#994738"; # Brown / Dark Accent (Deep Rustic Brown)
    };

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "Iosevka Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "Iosevka Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "Iosevka Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
