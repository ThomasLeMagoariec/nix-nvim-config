#local neotree = require("neo-tree-nvim")
local opt = { noremap = true }

vim.api.nvim_set_keymap("n", "<leader>fe", ":Neotree filesystem reveal left<CR>", opt)
