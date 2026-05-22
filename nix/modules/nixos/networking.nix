{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.printing.enable = true;
  services.openssh.enable = true;

  networking.networkmanager.ensureProfiles.environmentFiles = [ "/etc/secure/eduroam.env" ];

  networking.networkmanager.ensureProfiles.profiles = {
    eduroam = {
      connection = {
        id = "eduroam";
        type = "wifi";
      };
      wifi = {
        ssid = "eduroam";
        security = "802-11-wireless-security";
      };
      "802-11-wireless-security" = {
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "peap";
        identity = "$EDUROAM_USERNAME";
        anonymous-identity = "anonymous@polsl.pl";
        phase2-auth = "mschapv2";
        phase1-auth-flags = 32;
        password = "$EDUROAM_PASSWORD";
        ca-cert = "/etc/secure/eduroam-root-ca.crt";
        domain-match = "radius.polsl.pl";
      };
    };
  };
}
