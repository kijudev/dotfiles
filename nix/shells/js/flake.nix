{
  description = "JavaScript / TypeScript / Bun dev shell";

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
            pkgs.nodejs
            pkgs.bun
            pkgs.typescript

            pkgs.typescript-language-server
            pkgs.vscode-langservers-extracted
            pkgs.tailwindcss-language-server
            pkgs.prettier
            pkgs.vscode-js-debug
          ];
        };
      });
    };
}
