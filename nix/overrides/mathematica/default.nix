{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mathematica.override {
  source = pkgs.requireFile {
    name = "Wolfram_14.3.0_LIN_Bndl.sh";
    sha256 = "sha256-FvcXXijGOcuRA1UFyVvPIyR1YaK/qrkMpLxf+mz+A/c=";
    message = ''
      The Mathematica installer is required.
      Please ensure 'Wolfram_14.3.0_LIN_Bndl.sh' is in your Nix store
      with the correct hash: <YOUR-HASH>.
    '';
    hashMode = "recursive";
  };
}
