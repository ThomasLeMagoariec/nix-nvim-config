{ pkgs, ... }: {
    plugins = {
        lualine.enable = true;
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];

            mapping = {
                "<CR>" = "cmp.mapping.confirm({ select = true })";
            };
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
