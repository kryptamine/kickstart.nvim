return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true

      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_enable_italic = true

      local group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = group,
        pattern = 'gruvbox-material',
        callback = function()
          vim.api.nvim_set_hl(0, '@attribute.typescript', { fg = '#a9b665' })
        end,
      })

      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
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
      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
