{ pkgs, ... }: {
    plugins = {
        lualine.enable = true;
        luasnip.enable = true;
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];

            luaConfig.post = ''
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...
   ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

  -- ... Your other configuration ...
})            '';

        };

        cmp-nvim-lsp.enable = true;

        lsp = {
            enable = true;
            servers = {
                lua_ls.enable = true;
            };
        };


        telescope = {
            enable = true;
            keymap = {
                "<leader>ff" = { action = "<cmd>Telescope find_files<CR>"; };
                "<leader>fg" = { action = "<cmd>Telescope live_grep<CR>"; };
            };
        };
    };
    
    extraPlugins = [pkgs.vimPlugins.rose-pine];
}
