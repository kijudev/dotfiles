# Stylix theming — Woodland base16 colour scheme, polarity, and system fonts.
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

    # Earthy Beige & Sage color scheme
    # base16Scheme = {
    #   # --- Backgrounds & Foregrounds (Warm dark greys to soft beiges) ---
    #   base00 = "231e18"; # Default Background (kept your original dark warm tone)
    #   base01 = "2a251e"; # Lighter Background (Statuslines)
    #   base02 = "3e3831"; # Selection Background
    #   base03 = "6b635a"; # Comments (Muted warm grey, fades into the background)
    #   base04 = "968d83"; # Dark Foreground
    #   base05 = "c4baba"; # Default Foreground (Soft, easy-to-read beige)
    #   base06 = "dcd2cd"; # Light Foreground
    #   base07 = "f2eadd"; # Light Background (Rarely used in dark themes)
    #
    #   # --- Accents (Replacing the rainbow with earthy tones) ---
    #   base08 = "c2a383"; # Replaces Red (Warm sand - used for variables/XML tags)
    #   base09 = "ad9376"; # Replaces Orange (Darker sand - used for constants)
    #
    #   # The "Break it up" colors:
    #   base0A = "cfba72"; # Replaces Yellow (Soft gold - used for classes/warnings)
    #   base0B = "94a67f"; # Replaces Green (Sage green - used for strings/success)
    #   base0C = "8e9e85"; # Replaces Cyan (Pale moss - used for regex/escapes)
    #
    #   base0D = "a8a18f"; # Replaces Blue (Cool beige - used for functions/methods)
    #   base0E = "b3a58d"; # Replaces Purple (Yellow-tinted taupe - used for keywords)
    #   base0F = "877d6f"; # Replaces Brown (Deep khaki - used for deprecated code)
    # };

    # Monochromatic Beige with Sprinkled Colors
    base16Scheme = {
      base00 = "050505"; # Almost pure black
      base01 = "111111"; # Slightly lighter black for elevated surfaces
      base02 = "1c1b1a"; # Selection background
      base03 = "4d4a47"; # Comments (muted grey-beige)
      base04 = "7a7571"; # Dark foreground
      base05 = "e6e1d8"; # Default text (super light beige)
      base06 = "f0ece4"; # Light text
      base07 = "faf8f5"; # Lightest text/background

      # Sprinkled toned colors
      base08 = "c27e7e"; # Red (muted)
      base09 = "c49c76"; # Orange (muted)
      base0A = "c2b682"; # Yellow (muted)
      base0B = "96a885"; # Green (muted)

      # Monochromatic accents (Beige/Grey replacing typical syntax colors)
      base0C = "b5b0a3"; # Cyan mapped to muted beige
      base0D = "c2bdaf"; # Blue mapped to light beige
      base0E = "d1ccc0"; # Purple mapped to very light beige
      base0F = "8f8b84"; # Brown mapped to dark beige
    };

    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "IosevkaTerm Nerd Font";
      };

      sansSerif = {
        package = pkgs.iosevka;
        name = "Iosevka Aile";
      };

      serif = {
        package = pkgs.iosevka;
        name = "Iosevka Etoile";
      };
    };
  };
}
