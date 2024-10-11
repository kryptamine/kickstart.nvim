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
      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
