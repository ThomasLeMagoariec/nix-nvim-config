{
    # Import all your configuration modules here
    imports = [ ./bufferline.nix ];
    colorschemes.gruvbox.enable = true;

    plugins = {
        lualine.enable = true;

        cmp = {
            enable = true;
            settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];
        };

        lsp = {
            enable = true;
            autoLoad = true;
            inlayHints = true;
            servers = {
                lua_ls.enable = true;
            };
        };
    };
}
