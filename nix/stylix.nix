{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "131110"; # Default Background (Very deep warm charcoal)
      base01 = "1e1b19"; # Lighter Background (Status bars, line numbers)
      base02 = "302b28"; # Selection Background
      base03 = "4f4843"; # Comments, Invisibles, Line Highlighting
      base04 = "786f68"; # Dark Foreground (UI Elements)
      base05 = "cec3bb"; # Default Foreground (Text - Warm Oatmeal)
      base06 = "e6dcd3"; # Light Foreground (Not often used)
      base07 = "f5eee9"; # Light Background (Not often used)
      base08 = "c4746e"; # Red (Variables, Errors) - Muted Terracotta
      base09 = "d19a66"; # Orange (Integers, Booleans) - Clay
      base0A = "cfa870"; # Yellow (Classes, Search Text) - Old Gold
      base0B = "9ca874"; # Green (Strings) - Olive / Dry Moss
      base0C = "84a39c"; # Cyan (Regex, Escape chars) - Sage Grey
      base0D = "8b9eb5"; # Blue (Functions, Methods) - Slate / Storm Blue
      base0E = "b08bae"; # Purple (Keywords, Storage) - Dusty Mauve
      base0F = "a38179"; # Brown (Deprecated, delimiters) - Rust
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
    };
  };
}
