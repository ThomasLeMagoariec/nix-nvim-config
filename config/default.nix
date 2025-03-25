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

            luaConfig.post = ''
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>\n
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>\n
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>\n
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>\n
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n
nnoremap <silent> <leader>d <cmd>lua vim.diagnostic.open_float()<CR>\n
nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<CR>\n
nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<CR>\n
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>\n
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>\n
            '';
        };
    };

    keymaps = [
        {
            action = "<cmd>help<CR>";
            key = "<leader>g";
        }
    ];
}
