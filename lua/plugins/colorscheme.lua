return {
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    priority = 1000,
    config = function()
      local colors = require('vscode.colors').get_colors()
      require('vscode').setup {
        -- Enable transparent background
        transparent = false,

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = false,
        group_overrides = {
          TelescopePreviewBorder = { bg = colors.vscLeftDark, fg = colors.vscLeftDark },
          TelescopePreviewNormal = { bg = colors.vscLeftDark },
          TelescopePreviewTitle = { fg = colors.vscLeftDark, bg = colors.vscLeftDark },
          TelescopePromptBorder = { bg = colors.vscContext, fg = colors.vscContext },
          TelescopePromptCounter = { fg = '#FFFFFF' },
          TelescopePromptNormal = { bg = colors.vscContext },
          TelescopePromptPrefix = { bg = colors.vscContext, fg = colors.vscRed },
          TelescopePromptTitle = { fg = '#FFFFFF', bg = colors.vscRed },
          TelescopeResultsBorder = { bg = colors.vscLeftDark, fg = colors.vscLeftDark },
          TelescopeResultsNormal = { bg = colors.vscLeftDark },
          TelescopeResultsTitle = { fg = colors.vscLeftDark, bg = colors.vscLeftDark },
        },
      }

      -- vim.api.nvim_command 'colorscheme vscode'
    end,
  },
  {
    'fcancelinha/nordern.nvim',
    branch = 'master',
    priority = 1000,
    config = function()
      require('nordern').setup {
        transparent = false,
        brighter_comments = true,
        italic_comments = true,
        italicized_comments = true,
      }
      -- vim.api.nvim_command 'colorscheme nordern'
    end,
  },
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

      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
