{ pkgs, ... }:

{
  home.packages = with pkgs; [
    flyctl
    cloc
    nixfmt
    nixd
    package-version-server
    zed-editor
    github-copilot-cli
    python315
    lazygit
    yazi
    htop
    goose
    httpie
    httpie-desktop

    clang
    clang-tools

    go
    gopls

    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

    ghc
    cabal-install
    haskell-language-server
    ormolu

    ocaml
    dune_3
    opam
    ocamlPackages.ocaml-lsp

    clojure
    leiningen
    clojure-lsp

    nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    prettier

    zig
    zls

    typst

    vlc
    obsidian
    xournalpp
    discord
    proton-vpn
    protonmail-desktop
    onlyoffice-desktopeditors
    prismlauncher
    claude-code
    galaxy-buds-client
    blanket
  ];
}
