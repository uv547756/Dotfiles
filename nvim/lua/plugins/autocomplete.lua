-- Autocompletion plugin setup using lazy.nvim
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {'L3MON4D3/LuaSnip'},         -- Snippet engine
    {'hrsh7th/cmp-buffer'},       -- Buffer completions
    {'hrsh7th/cmp-nvim-lsp'},     -- LSP completions
    {'saadparwaiz1/cmp_luasnip'}, -- LuaSnip completions
  },
  config = function()
    -- nvim-cmp setup
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)  -- Using LuaSnip for snippets
        end,
      },
      window = {
        -- Optional: Configure the completion window as needed
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },   -- LSP completions
        { name = 'luasnip' },    -- LuaSnip completions
        { name = 'path' },       -- Path completions
      }, {
        { name = 'buffer',       -- Buffer completions
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
      })
    })
  end
}

