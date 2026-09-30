{
  description = "Go + htmx/templ + TypeScript web dev shell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        f: nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (s: f nixpkgs.legacyPackages.${s});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.go
            pkgs.gopls
            pkgs.delve
            pkgs.gotools
            pkgs.gofumpt
            pkgs.golangci-lint
            pkgs.golangci-lint-langserver
            pkgs.air
            pkgs.goose

            pkgs.templ
            pkgs.htmx-lsp

            pkgs.nodejs
            pkgs.typescript
            pkgs.typescript-language-server
            pkgs.vscode-langservers-extracted
            pkgs.tailwindcss-language-server
            pkgs.prettier
          ];

          hardeningDisable = [ "fortify" ];
        };
      });
    };
}
