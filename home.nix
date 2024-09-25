{ config, pkgs, ... }:

{
  home.username = "kiju";
  home.homeDirectory = "/home/kiju";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    oh-my-zsh
    helix
  ];

  programs.git = {
    enable = true;
    userName = "kiju";
    userEmail = "kijekkuba2006@gmail.com";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "fino-time";
    };
  };

  stylix.targets.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, F, exec, firefox"
      ];
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      #theme = "cattpuccin-mocha";
    };
  };
}
