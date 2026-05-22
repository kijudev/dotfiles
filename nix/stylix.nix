{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    # Woodland color scheme
    # base16Scheme = {
    #   base00 = "231e18";
    #   base01 = "302b25";
    #   base02 = "48413a";
    #   base03 = "9d8b70";
    #   base04 = "b4a490";
    #   base05 = "cabcb1";
    #   base06 = "d7c8bc";
    #   base07 = "e4d4c8";
    #   base08 = "d35c5c";
    #   base09 = "ca7f32";
    #   base0A = "e0ac16";
    #   base0B = "b7ba53";
    #   base0C = "6eb958";
    #   base0D = "88a4d3";
    #   base0E = "bb90e2";
    #   base0F = "b49368";
    # };

    base16Scheme = {
      base00 = "050505"; # Almost pure black
      base01 = "111111"; # Slightly lighter black for elevated surfaces
      base02 = "1c1b1a"; # Selection background
      base03 = "4d4a47"; # Comments (muted grey-beige)
      base04 = "7a7571"; # Dark foreground
      base05 = "e6e1d8"; # Default text (super light beige)
      base06 = "f0ece4"; # Light text
      base07 = "ffffff"; # Lightest text/background (pure white)

      # 100% Monochromatic accents (shades of beige/white/grey)
      base08 = "dcd8cf"; # Shade 1
      base09 = "d4cfc3"; # Shade 2
      base0A = "ccc6b8"; # Shade 3
      base0B = "c4bead"; # Shade 4
      base0C = "bdb6a3"; # Shade 5
      base0D = "b5b0a3"; # Shade 6
      base0E = "adaba1"; # Shade 7
      base0F = "a6a59d"; # Shade 8
    };

    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.blex-mono;
        name = "BlexMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };

      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };

      sizes = {
        terminal = 14;
        applications = 14;
      };
    };
  };
}
