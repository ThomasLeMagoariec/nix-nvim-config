{ pkgs, ... }: {
    plugins = {
        lualine.enable = true;
        cmp = {
            autoEnableSources = true;
            settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];
        };

        cmp-nvim-lsp.enable = true;

        lsp = {
            enable = true;
            servers = {
                lua_ls.enable = true;
            };
        };
    };
}
