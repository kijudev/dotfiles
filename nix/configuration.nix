{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./stylix.nix
    ./modules/nixos/boot.nix
    ./modules/nixos/hardware.nix
    ./modules/nixos/audio.nix
    ./modules/nixos/networking.nix
    ./modules/nixos/locale.nix
    ./modules/nixos/desktop.nix
    ./modules/nixos/virtualisation.nix
    ./modules/nixos/programs.nix
    ./modules/nixos/users.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
