{
  description = "OCaml dev shell";

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
          ocamlPkgs = pkgs.ocamlPackages;
        in
        {
          default = pkgs.mkShell {
            packages = [
              ocamlPkgs.ocaml
              ocamlPkgs.dune_3
              ocamlPkgs.findlib
              ocamlPkgs.ocaml-lsp
              ocamlPkgs.ocamlformat
              ocamlPkgs.utop
              ocamlPkgs.odoc
              ocamlPkgs.earlybird
            ];

            buildInputs = [ ];
          };
        }
      );
    };
}
