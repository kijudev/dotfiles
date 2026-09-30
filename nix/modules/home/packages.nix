{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cloc
    lazygit
    yazi
    htop
    httpie
    lshw
    tcpdump
    tpm2-tools
    sbctl
    wl-clipboard
    xclip
    flyctl
    python315

    claude-code
    github-copilot-cli
    goose

    nixfmt
    nixd
    nil
    marksman
    prettier
    typst
    tinymist
    package-version-server
    zed-editor

    httpie-desktop
    vlc
    obsidian
    xournalpp
    discord
    proton-vpn
    protonmail-desktop
    onlyoffice-desktopeditors
    galaxy-buds-client
    blanket
  ];
}
