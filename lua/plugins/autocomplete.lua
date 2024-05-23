return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'onsails/lspkind.nvim',
    {
      'zbirenbaum/copilot-cmp',
      dependencies = 'zbirenbaum/copilot.lua',
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require 'copilot_cmp'
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        local on_attach = function(client)
          if client.name == 'copilot' then
            copilot_cmp._on_insert_enter {}
          end
        end
        require('copilot').setup { on_attach = on_attach }
      end,
    },
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    lspkind.init {
      symbol_map = {
        Copilot = '',
      },
    }
    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            gh_issues = '[issues]',
            tn = '[TabNine]',
            eruby = '[erb]',
            copilot = '[copilot]',
          },
        },
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
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        {

          { name = 'path' },
          { name = 'buffer' },
        },
      },
      sorting = {
        comparators = {
          cmp.config.compare.locality,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,

          -- copied from cmp-under, but I don't think I need the plugin for this.
          -- I might add some more of my own.
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find '^_+'
            local _, entry2_under = entry2.completion_item.label:find '^_+'
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,

          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      experimental = {
        ghost_text = false,
      },
    }
  end,
}
