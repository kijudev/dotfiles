# Users — defines the kiju user account, group memberships, and default shell.
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
    ];
    shell = pkgs.zsh;
  };
}
