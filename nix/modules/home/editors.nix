# Editors — Helix configuration with editor UI settings, per-language formatting, and language server setup.
{
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
      # --- C / C++ ---
      {
        name = "c";
        auto-format = true;
        formatter = {
          command = "clang-format";
          args = [ "--style=file" ];
        };
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "cpp";
        auto-format = true;
        formatter = {
          command = "clang-format";
          args = [ "--style=file" ];
        };
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }

      # --- Go ---
      {
        name = "go";
        auto-format = true;
        language-servers = [ "gopls" ];
        indent = {
          tab-width = 4;
          unit = "\t";
        };
      }

      # --- Rust ---
      {
        name = "rust";
        auto-format = true;
        language-servers = [ "rust-analyzer" ];
      }

      # --- JavaScript / TypeScript ---
      {
        name = "javascript";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "babel"
          ];
        };
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "typescript";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "typescript"
          ];
        };
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "jsx";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "babel"
          ];
        };
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "tsx";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "babel-ts"
          ];
        };
        language-servers = [ "typescript-language-server" ];
      }

      # --- HTML / CSS ---
      {
        name = "html";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "html"
          ];
        };
        language-servers = [ "vscode-html-language-server" ];
      }
      {
        name = "css";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "css"
          ];
        };
        language-servers = [ "vscode-css-language-server" ];
      }

      # --- Haskell ---
      {
        name = "haskell";
        auto-format = true;
        formatter = {
          command = "ormolu";
          args = [
            "--stdin-input-file"
            "."
          ];
        };
        language-servers = [ "haskell-language-server" ];
      }

      # --- OCaml ---
      {
        name = "ocaml";
        auto-format = true;
        # ocamllsp handles formatting via LSP
        language-servers = [ "ocamllsp" ];
      }

      # --- Typst ---
      {
        name = "typst";
        auto-format = true;
        # tinymist handles formatting via LSP
        language-servers = [ "tinymist" ];
      }

      # --- Zig ---
      {
        name = "zig";
        auto-format = true;
        formatter = {
          command = "zig";
          args = [
            "fmt"
            "--stdin"
          ];
        };
        language-servers = [ "zls" ];
      }

      # --- Nix ---
      {
        name = "nix";
        auto-format = true;
        # nixfmt is provided by the nixfmt-rfc-style package
        formatter = {
          command = "nixfmt";
        };
        language-servers = [ "nil" ];
      }

      # --- JSON ---
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

      # --- Markdown ---
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
        language-servers = [ "marksman" ];
      }
    ];

    languages.language-server = {

      # --- clangd (C / C++) ---
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
          # clangd inlay hints are configured via a .clangd file in the project root,
          # not through initializationOptions
          clangd.fallbackFlags = [ "-std=c++23" ];
        };
      };

      # --- gopls (Go) ---
      gopls = {
        command = "gopls";
        config = {
          hints = {
            assignVariableTypes = true;
            compositeLiteralFields = true;
            compositeLiteralTypes = true;
            constantValues = true;
            functionTypeParameters = true;
            parameterNames = true;
            rangeVariableTypes = true;
          };
          analyses = {
            unusedparams = true;
            shadow = true;
          };
          staticcheck = true;
        };
      };

      # --- rust-analyzer (Rust) ---
      rust-analyzer = {
        command = "rust-analyzer";
        config = {
          checkOnSave = true;
          inlayHints = {
            bindingModeHints.enable = true;
            chainingHints.enable = true;
            closureCaptureHints.enable = true;
            parameterHints.enable = true;
            typeHints.enable = true;
            closureReturnTypeHints.enable = "always";
          };
        };
      };

      # --- typescript-language-server (JS / TS / JSX / TSX) ---
      typescript-language-server = {
        command = "typescript-language-server";
        args = [ "--stdio" ];
        config = {
          preferences = {
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayVariableTypeHints = true;
            includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayEnumMemberValueHints = true;
          };
        };
      };

      # --- vscode-html-language-server (HTML) ---
      vscode-html-language-server = {
        command = "vscode-html-language-server";
        args = [ "--stdio" ];
      };

      # --- vscode-css-language-server (CSS) ---
      vscode-css-language-server = {
        command = "vscode-css-language-server";
        args = [ "--stdio" ];
      };

      # --- haskell-language-server (Haskell) ---
      haskell-language-server = {
        command = "haskell-language-server-wrapper";
        args = [ "--lsp" ];
      };

      # --- ocamllsp (OCaml) ---
      ocamllsp = {
        command = "ocamllsp";
      };

      # --- tinymist (Typst) ---
      tinymist = {
        command = "tinymist";
        config = {
          exportPdf = "onType";
          formatterMode = "typstyle";
        };
      };

      # --- zls (Zig) ---
      zls = {
        command = "zls";
        config = {
          enable_inlay_hints = true;
          inlay_hints_show_variable_type_hints = true;
          inlay_hints_show_parameter_name = true;
          inlay_hints_show_builtin = true;
          inlay_hints_exclude_single_argument = false;
        };
      };

      # --- nil (Nix) ---
      # Tell nil to use nixfmt (from nixfmt-rfc-style) for LSP formatting requests
      nil = {
        command = "nil";
        config = {
          nil = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
      };

      # --- marksman (Markdown) ---
      # Provides link completions, cross-file references, and document outline
      marksman = {
        command = "marksman";
        args = [ "server" ];
      };
    };
  };
}
