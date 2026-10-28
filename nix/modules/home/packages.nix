{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cloc
    lazygit
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
    just
    bottles
    beekeeper-studio

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
    gnome-solanum

    bubblewrap
  ];

  xdg.dataFile =
    let
      nodeVersion = "node-v26.12.0-linux-x64";
      nodePackage = pkgs.nodejs_26;
    in
    {
      "zed/node/${nodeVersion}/bin".source = "${nodePackage}/bin";
      "zed/node/${nodeVersion}/include".source = "${nodePackage}/include";
      "zed/node/${nodeVersion}/lib".source = "${nodePackage}/lib";
      "zed/node/${nodeVersion}/share".source = "${nodePackage}/share";
    };
}
