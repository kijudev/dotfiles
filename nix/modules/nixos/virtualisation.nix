# Virtualisation — rootless Docker, virt-manager with libvirtd/QEMU/KVM, and SPICE USB redirection.
{
  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Virt-manager / QEMU / KVM
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "kiju" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
