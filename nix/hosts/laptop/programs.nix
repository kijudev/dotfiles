{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Lets prebuilt binaries that Zed downloads (e.g. copilot-language-server) run
  programs.nix-ld.enable = true;

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
  '';

  # VirtualBox on the KVM backend so it can run alongside libvirt/QEMU VMs.
  # Only NAT networking is supported in this mode (no host-only vboxnet0).
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
  };

  users.users.kiju.extraGroups = [
    "wireshark"
    "vboxusers"
  ];

  home-manager.users.kiju.home.packages = with pkgs; [
    prismlauncher
  ];

  nixpkgs.overlays = [
    (self: super: {
      mathematica = super.mathematica.overrideAttrs (oldAttrs: {
        version = "15.0.1";
        src = super.requireFile {
          name = "Wolfram_15.0.1_LIN.sh";
          sha256 = "sha256-7N5FJoj0gTGNwY3Q+8hJGZi+ze6IRRMnwu6nLEv3cF4=";
          message = ''
            Download Wolfram_15.0.1_LIN.sh from wolfram.com and add it with:
              nix-store --add-fixed sha256 Wolfram_15.0.1_LIN.sh
          '';
        };
      });
    })
  ];

  environment.systemPackages = [
    pkgs.mathematica
  ];
}
