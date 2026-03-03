# Desktop environment — Xserver, GDM display manager, and GNOME session.
{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
