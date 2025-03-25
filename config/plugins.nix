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


        web-devicons.enable = true;

        telescope = {
            enable = true;
            extensions = {
                live-grep-args.enable = true;
                ui-select = {
                    enable = true;
                    settings.specific_opts = { codeactions = true; };
                };
            };
            keymaps = {
                "<leader>ff" = { action = "find_files"; };
                "<leader>fg" = { action = "live_grep"; };
            };
        };

        treesitter = {
            enable = true;
            settings = {
                auto_install = true;
                highlight.enable = true;
            };
        };

        ollama.enable = true;
        neocord.enable = true;
        neo-tree.enable = true;
    };
    
    extraPlugins = [pkgs.vimPlugins.rose-pine];
}
