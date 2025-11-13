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
      zellij

      nixfmt-rfc-style
      nil
      prettier

      vlc
      obsidian
      rawtherapee
      vesktop
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

  programs.zellij = {
    enable = true;

    settings = {
      pane-frames = true;
      simplified_ui = true;
      default_layout = "compact";
    };
  };

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
      background_opacity 1
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
      {
        name = "rust";
        auto-format = true;
        language-servers = [ "rust-analyzer" ];
      }
    ];

    languages.language-server = {
      rust-analyzer = {
        command = "rust-analyzer";
        args = [ ];
        config = {
          checkOnSave = true;
          inlayHints = {
            bindingModeHints = true;
            chainingHints = true;
            closureCaptureHints = true;
            parameterHints = true;
            typeHints = true;
          };
        };
      };
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
      enabled-extensions = [
        "blur-my-shell@aunetx"
      ];
      disable-user-extensions = false;
    };
  };
}
