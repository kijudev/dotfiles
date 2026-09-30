{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./boot.nix
    ./eduroam.nix
    ./programs.nix
    ../../modules/nixos/common
  ];

  system.stateVersion = "25.05";
}
