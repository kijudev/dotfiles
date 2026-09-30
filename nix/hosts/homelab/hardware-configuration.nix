# PLACEHOLDER - replace with the output of `nixos-generate-config --show-hardware-config`
# on the homelab machine. Exists only so the flake evaluates before the install.
{ lib, ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
