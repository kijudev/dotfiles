# Desktop integration — GNOME shell extension settings and virt-manager connection via dconf.
{
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "blur-my-shell@aunetx" ];
      disable-user-extensions = false;
    };
  };
}
