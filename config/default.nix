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
        { key = "gd" action = "<cmd>vim.lsp.buf.definition()<CR>"; }
        { key = "K" action = "<cmd>vim.lsp.buf.hover()<CR>"; }
        { key = "<leader>rn" action = "<cmd>vim.lsp.buf.rename()<CR>"; }
        { key = "<leader>ca" action = "<cmd>vim.lsp.buf.code_action()<CR>"; }
        { key = "gr" action = "<cmd>vim.lsp.buf.references()<CR>"; }
        { key = "<leader>d" action = "<cmd>vim.diagnostic.open_float()<CR>"; }
        { key = "[d" action = "<cmd>vim.diagnostic.goto_prev()<CR>"; }
        { key = "]d" action = "<cmd>vim.diagnostic.goto_next()<CR>"; }
        { key = "<C-k>" action = "<cmd>vim.lsp.buf.signature_help()<CR>"; }
        { key = "<leader>f" action = "<cmd>vim.lsp.buf.formatting()<CR>"; }
    ];
}
