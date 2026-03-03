# System programs — Firefox, Zsh, Flatpak, GPG agent, Steam, and system-level packages.
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lshw
    tpm2-tools
    sbctl

    # Language servers (system-wide)
    nil # Nix
    marksman # Markdown
    tinymist # Typst
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
}
