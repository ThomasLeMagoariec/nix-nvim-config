{self, ...}: {
    keymaps = [
        { key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; }
        { key = "<leader>fe"; action = "<cmd>Neotree filesystem reveal float<CR>"; }
    ];
}
