{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    useOSProber = true;
    efiSupport = true;
    devices = [ "/dev/nvme0n1" ];
    extraEntries = ''
      menuentry "Windows 11" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root A6BA-86EB
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };

  security.tpm2.enable = true;
  boot.initrd.systemd.enable = true;
}
