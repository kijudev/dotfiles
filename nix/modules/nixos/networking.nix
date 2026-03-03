# Networking — hostname, NetworkManager, CUPS printing, OpenSSH, and eduroam profile.
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # eduroam WPA2-Enterprise profile for Politechnika Śląska
  # CA certificate verification is disabled — required to connect to the university RADIUS server
  # WARNING: password is intentionally omitted here since the nix store is world-readable.
  # After rebuilding, set your password once with:
  #   nmcli connection modify eduroam 802-1x.identity "YOUR_ID@polsl.pl" 802-1x.password "YOUR_PASSWORD"
  networking.networkmanager.ensureProfiles.profiles = {
    eduroam = {
      connection = {
        id = "eduroam";
        type = "wifi";
        autoconnect = "true";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "peap;";
        identity = "";
        anonymous-identity = "anonymous@polsl.pl";
        phase2-auth = "mschapv2";
        # Disable CA certificate verification — the "lowering security" required for eduroam here
        phase2-ca-cert = "";
        system-ca-certs = "false";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };

  services.printing.enable = true;
  services.openssh.enable = true;
}
