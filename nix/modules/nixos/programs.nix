# System programs — Firefox, Zsh, Flatpak, GPG agent, Steam, and system-level packages.
{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    lshw
    tpm2-tools
    sbctl

    # Language servers
    nil # Nix
    marksman # Markdown
    tinymist # Typst

    # Networking bullshit
    # gns3-gui
    tcpdump
    cisco-packet-tracer_9
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

  # Wireshark USB traffic capture
  services.udev.extraRules = ''
    SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
  '';
}
