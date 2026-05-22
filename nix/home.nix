# Home Manager entry point — sets user identity and imports all home modules.
{ ... }:

{
  imports = [
    ./modules/home/packages.nix
    ./modules/home/shell.nix
    ./modules/home/git.nix
    ./modules/home/terminal.nix
    ./modules/home/editors.nix
    ./modules/home/desktop.nix
  ];

  home = {
    username = "kiju";
    homeDirectory = "/home/kiju";
  };


  # Allow Home Manager/Stylix to overwrite existing GTK CSS files.
  xdg.configFile."gtk-3.0/gtk.css".force = true;
  xdg.configFile."gtk-4.0/gtk.css".force = true;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";


  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;
}
