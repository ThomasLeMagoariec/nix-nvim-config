{
    # Import all your configuration modules here
    imports = [ ./bufferline.nix ];
    colorschemes.gruvbox.enable = true;

    globals.mapleader = " ";

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

    keymaps = [
        {
            action = "<cmd>help<CR>";
            key = "<leader>g";
        }
        { key = "<leader>gd"; action = "<cmd>lua vim.lsp.buf.definition()<CR>"}
    ];
}
