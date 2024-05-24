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
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            copilot = '[copilot]',
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            gh_issues = '[issues]',
            tn = '[TabNine]',
            eruby = '[erb]',
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
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
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
