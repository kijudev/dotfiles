# User packages — apps, dev tools, and fonts installed into the home environment.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev
    flyctl
    cloc
    nixfmt-rfc-style
    nixd
    package-version-server
    zed-editor
    github-copilot-cli
    python315
    lazygit
    yazi

    # Personal
    vlc
    obsidian
    xournalpp
    discord
    protonvpn-gui
    protonmail-desktop
    onlyoffice-desktopeditors
    prismlauncher
  ];
}
