{
  pkgs,
  ...
}:
{
  imports = [ ];

  home = {
    username = "kiju";
    homeDirectory = "/home/kiju";
    packages = with pkgs; [
      helix

      nixfmt-rfc-style
      nil
      prettier

      vlc
      obsidian
      rawtherapee
      vesktop
      proton-plus
      protonvpn-gui
      protonmail-desktop

      pkgs.iosevka
      pkgs.nerd-fonts.iosevka
      pkgs.nerd-fonts.iosevka-term
    ];
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "Kiju";
    userEmail = "dev@jakubkijek.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    history.size = 4096;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.85
      background_blur 1
      font_size 14
      hide_window_decorations yes
      window_border_width 0
      window_padding_width 4 8
      draw_minimal_borders yes
    '';
  };

  programs.helix = {
    enable = true;

    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        auto-completion = true;
        preview-completion-insert = true;

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          center = [ ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-type"
          ];
          separator = "│";
        };

        indent-guides = {
          render = true;
          character = "┊";
          skip-levels = 0;
        };

        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
      };
    };

    languages.language = [
      {
        name = "cpp";
        auto-format = true;
        formatter = {
          command = "clang-format";
          args = [ "--style=file" ];
        };
      }
      {
        name = "c";
        auto-format = true;
        formatter = {
          command = "clang-format";
          args = [ "--style=file" ];
        };
      }
      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = "nixpkgs-fmt";
        };
      }
      {
        name = "json";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "json"
          ];
        };
      }
      {
        name = "markdown";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "markdown"
          ];
        };
      }
    ];

    languages.language-server = {
      clangd = {
        command = "clangd";
        args = [
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=llvm"
          "--header-insertion=iwyu"
          "--pch-storage=memory"
          "--cross-file-rename"
          "--log=error"
        ];

        config = {
          clangd = {
            fallbackFlags = [ "-std=c++20" ];
          };
          inlayHints = {
            typeHints = true;
            parameterHints = true;
            chainingHints = true;
          };
        };
      };

      nil = {
        command = "nil";
      };
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enables-extensions = [
        "org/gnome/shell/extensions/blur-my-shell"
        "org/gnome/shell/extensions/pop-shell"
      ];
    };
    "org/gnome/shell/extensions/blur-my-shell" = {
      "blacklist" = "@as []";
      "blur-on-overview" = false;
      "brightness" = "1.0";
      "customize" = true;
      "enable-all" = true;
      "opacity" = "250";
      "sigma" = "59";
      "blur" = true;
    };
    "org/gnome/shell/extensions/pop-shell" = {
      "active-hint" = false;
      "active-hint-border-radius" = "uint32 6";
      "tile-by-default" = true;
      "gap-inner" = "uint32 2";
      "gap-outer" = "uint32 2";
      "mouse-cursor-follows-active-window" = true;
      "show-skip-taskbar" = true;
      "show-title" = true;
      "stacking-with-mouse" = true;
    };
  };
}
