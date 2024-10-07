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
  stylix.targets.helix.enable = false;

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
      theme = "rose_pine_custom";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "ocaml";
        auto-format = true;
        formatter.command = "${pkgs.ocamlformat_0_22_4}/bin/ocamlformat";
      }
    ];
    themes = {
      rose_pine_custom = {
        "inherits" = "rose_pine";
        "ui.background" = { fg = "foreground"; };
      };
    };
  };
}
