# Networking — hostname, NetworkManager, CUPS printing, and OpenSSH daemon.
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.printing.enable = true;
  services.openssh.enable = true;
}
