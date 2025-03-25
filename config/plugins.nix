{ pkgs, ... }: {
    plugins = {
        none-ls = {
            enable = true;
            settings = {
                cmd = ["bash -c nvim"];
                debug = true;
            };
            sources = {
                code_actions = {
                    statix.enable = true;
                    gitsigns.enable = true;
                };
                diagnostics = {
                    statix.enable = true;
                    deadnix.enable = true;
                    pylint.enable = true;
                    checkstyle.enable = true;
                };
                formatting = {
                    alejandra.enable = true;
                    stylua.enable = true;
                    shfmt.enable = true;
                    nixpkgs_fmt.enable = true;
                    google_java_format.enable = false;
                    prettier = {
                        enable = true;
                    };
                    black = {
                        enable = true;
                        settings = ''
                        {
                            extra_args = { "--fast" },
                        }
                        '';

                    };
                };
                completion = {
                    luasnip.enable = true;
                    spell.enable = true;
                };
            };
        };

         lint = {
            enable = true;
            lintersByFt = {
                text = ["vale"];
                json = ["jsonlint"];
                markdown = ["vale"];
                dockerfile = ["hadolint"];
            };
        };

        lsp = {
            enable = true;
            servers = {
                cssls.enable = true; # CSS
                html.enable = true; # HTML
                pyright.enable = true; # Python
                marksman.enable = true; # Markdown
                nil_ls.enable = true; # Nix
                dockerls.enable = true; # Docker
                bashls.enable = true; # Bash
                clangd.enable = true; # C/C++
                csharp_ls.enable = true; # C#
                yamlls.enable = true; # YAML
                ltex = {
                    enable = true;
                    settings = {
                    enabled = [ "astro" "html" "latex" "markdown" "text" "tex" "gitcommit" ];
                    completionEnabled = true;
                    language = "en-US fr-FR";
                    # dictionary = {
                    #   "nl-NL" = [
                    #     ":/home/liv/.local/share/nvim/ltex/nl-NL.txt"
                    #   ];
                    #   "en-US" = [
                    #     ":/home/liv/.local/share/nvim/ltex/en-US.txt"
                    #   ];
                    #   "de-DE" = [
                    #     ":/home/liv/.local/share/nvim/ltex/de-DE.txt"
                    #   ];
                    # };
                };
            };
            gopls = { # Golang
                enable = true;
                autostart = true;
            };

            lua_ls = { # Lua
                enable = true;
                settings.telemetry.enable = false;
            };

          };
        };
    };
}
