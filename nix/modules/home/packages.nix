# User packages — apps, dev tools, and fonts installed into the home environment.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors & IDEs
    zed-editor
    vscode-fhs

    # Dev tools
    flyctl
    nixd
    package-version-server
    cloc
    nixfmt-rfc-style
    prettier
    nodejs_24
    pnpm

    # Apps
    vlc
    obsidian
    xournalpp
    rawtherapee
    discord
    protonvpn-gui
    protonmail-desktop
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    onlyoffice-desktopeditors

    # Clankers
    github-copilot-cli
    gemini-cli
  ];
}
