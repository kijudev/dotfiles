{
  description = "Kiju's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      mkHost =
        name:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/${name}
            { networking.hostName = name; }
          ];
        };
    in
    {
      nixosConfigurations = {
        laptop = mkHost "laptop";
        homelab = mkHost "homelab";
      };

      # Dev shell starters: `nix flake init -t ~/Dotfiles/nix#go`
      templates = builtins.mapAttrs (name: _: {
        path = ./shells/${name};
        description = "${name} dev shell";
      }) (builtins.readDir ./shells);
    };
}
