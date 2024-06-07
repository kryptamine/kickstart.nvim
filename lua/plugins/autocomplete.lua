return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local kind_icons = require('config.icons').kind

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      formatting = {
        format = function(entry, vim_item)
          local lspkind_ok, lspkind = pcall(require, 'lspkind')
          if not lspkind_ok then
            -- From kind_icons array
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            -- Source
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              nvim_lua = '[Lua]',
            })[entry.source.name]
            return vim_item
          else
            -- From lspkind
            return lspkind.cmp_format()(entry, vim_item)
          end
        end,
      },
      preselect = 'None',
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'treesitter' },
      },
      experimental = {
        ghost_text = true,
        native_menu = false,
      },
    }
  end,
}
