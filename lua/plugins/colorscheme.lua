return {
  {
    'blazkowolf/gruber-darker.nvim',
    name = 'gruber-darker',
    config = function()
      require('gruber-darker').setup {
        bold = false,
        undercurl = true,
        underline = true,
        invert = {
          signs = false,
          tabline = false,
          visual = false,
        },
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
      }

      vim.api.nvim_set_hl(0, '@punctuation.delimiter.jsdoc', { fg = '#73D936' })

      -- Tekescope borderless
      local bg = '#1e1e1e'
      local header = '#2f2f2f'
      local title = '#95A99F'

      local TelescopePrompt = {
        TelescopeMatching = { fg = '#ffffff', bg = header, bold = true },
        TelescopeSelection = { fg = '#ffffff', bg = header, bold = true },
        TelescopePromptPrefix = { bg = header },
        TelescopePromptNormal = { bg = header },
        TelescopeResultsNormal = { bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePromptBorder = { bg = header, fg = header },
        TelescopeResultsBorder = { bg = bg, fg = bg },
        TelescopePreviewBorder = { bg = bg, fg = bg },
        TelescopePromptTitle = { bg = title, fg = bg },
        TelescopeResultsTitle = { fg = bg },
        TelescopePreviewTitle = { bg = title, fg = bg },
      }

      for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
      end

      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
