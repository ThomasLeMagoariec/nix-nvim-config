{self, ...}: {
    keymaps = [
        { key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; };
    ];
}
