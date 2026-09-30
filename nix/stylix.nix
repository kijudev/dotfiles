{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    polarity = "dark";

    base16Scheme = {
      base00 = "0a0908";
      base01 = "110f0d";
      base02 = "1d1a16";
      base03 = "70655c";
      base04 = "94897f";
      base05 = "c9c2ba";
      base06 = "d9d4ce";
      base07 = "e8e6e3";

      base08 = "b5a89b";
      base09 = "bcb0a4";
      base0A = "cbc2b9";
      base0B = "afa192";
      base0C = "a69787";
      base0D = "bcb1a4";
      base0E = "998775";
      base0F = "d1c9c1";
    };

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
        terminal = 13;
        applications = 12;
      };
    };
  };
}
