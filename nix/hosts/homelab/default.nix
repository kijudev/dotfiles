{
  imports = [
    ./hardware-configuration.nix
    ./server.nix
    ../../modules/nixos/common
  ];

  system.stateVersion = "26.05";
}
