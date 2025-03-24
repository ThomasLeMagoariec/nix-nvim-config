local opt = { noremap = true }
local telescope = require("telescope")

telescope.setup({})
telescope.load_extension("recent_files")

vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fr", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt)


