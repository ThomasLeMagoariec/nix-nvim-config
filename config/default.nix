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
        { key = "gd"; action = "vim.lsp.buf.definition()"; }
        { key = "K"; action = "vim.lsp.buf.hover()"; }
        { key = "<leader>rn"; action = "vim.lsp.buf.rename()"; }
        { key = "<leader>ca"; action = "vim.lsp.buf.code_action()"; }
        { key = "gr"; action = "vim.lsp.buf.references()"; }
        { key = "<leader>d"; action = "vim.diagnostic.open_float()"; }
        { key = "[d"; action = "vim.diagnostic.goto_prev()"; }
        { key = "]d"; action = "vim.diagnostic.goto_next()"; }
        { key = "<C-k>"; action = "vim.lsp.buf.signature_help()"; }
        { key = "<leader>f"; action = "vim.lsp.buf.formatting()"; }
    ];
}
