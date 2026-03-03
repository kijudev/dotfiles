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

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;
}
