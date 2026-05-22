# Flake entry point — defines inputs (nixpkgs, home-manager, stylix)
# and wires them together into the nixosConfigurations output.
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
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        kiju = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs outputs; };

              # Avoid activation failures when existing files would be clobbered.
              home-manager.backupFileExtension = "hm-bak";

              home-manager.users.kiju = import ./home.nix;

            }

            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
