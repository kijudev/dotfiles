{
  description = "Scala dev shell";

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
          jdk = pkgs.jdk21;
        in
        {
          default = pkgs.mkShell {
            packages = [
              jdk
              (pkgs.sbt.override { jre = jdk; })
              (pkgs.scala-cli.override { jre = jdk; })
              (pkgs.metals.override { jre = jdk; })
              pkgs.scalafmt
            ];

            JAVA_HOME = jdk.home;
          };
        }
      );
    };
}
