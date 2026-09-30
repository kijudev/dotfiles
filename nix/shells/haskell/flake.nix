{
  description = "Haskell dev shell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        f: nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (s: f nixpkgs.legacyPackages.${s});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          hs = pkgs.haskellPackages;
        in
        {
          default = pkgs.mkShell {
            packages = [
              hs.ghc
              pkgs.cabal-install
              pkgs.haskell-language-server
              pkgs.ormolu
              pkgs.hlint
              pkgs.ghcid
              hs.haskell-debug-adapter
              hs.ghci-dap
            ];

            buildInputs = [
              pkgs.zlib
              pkgs.pkg-config
            ];
          };
        }
      );
    };
}
