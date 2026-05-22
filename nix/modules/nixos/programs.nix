{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lshw
    tpm2-tools
    sbctl
    ventoy
    nil
    marksman
    tinymist
    tcpdump
    cisco-packet-tracer_9
    wl-clipboard
    xclip
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  services.flatpak.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
  '';

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.10"
  ];
}
