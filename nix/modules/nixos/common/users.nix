{ pkgs, ... }:
{
  users.users.kiju = {
    isNormalUser = true;
    description = "kiju";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "dialout"
    ];

    shell = pkgs.zsh;
  };
}
