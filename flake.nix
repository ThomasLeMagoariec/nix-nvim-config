{
    description = "Neovim Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        neovim = {
            url = "github:nix-community/neovim-nightly-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        telescope-recent-files-src = {
            url = "github:smartpde/telescope-recent-files";
            flake = false;
        };
        tree-sitter-src = {
            url = "github:nvim-treesitter/nvim-treesitter";
            flake = false;
        };
        alpha-src = {
            url = "github:goolord/alpha-nvim";
            flake = false;
        };
    };
    outputs = { self, nixpkgs, neovim, telescope-recent-files-src, tree-sitter-src }:
    let
      overlayFlakeInputs = prev: final: {
            neovim = neovim.packages.x86_64-linux.neovim;

            vimPlugins = final.vimPlugins // {
                telescope-recent-files = import ./packages/vimPlugins/telescope-recent-files.nix {
                    src = telescope-recent-files-src;
                    pkgs = prev;
                };
                tree-sitter = import ./packages/vimPlugins/tree-sitter.nix {
                    src = tree-sitter-src;
                    pkgs = prev;
                };
                alpha = import ./packages/vimPlugins/alpha.nix {
                    src = alpha-src;
                    pkgs = prev;
                };
            };
      };
      overlayMyNeovim = prev: final: {
            myNeovim = import ./packages/myneovim.nix { pkgs = final; };
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayMyNeovim ];
      };
    in {
        packages.x86_64-linux.default = pkgs.myNeovim;
        apps.x86_64-linux.default = {
            type = "app";
            program = "${pkgs.myNeovim}/bin/nvim";
        };
    };
}
