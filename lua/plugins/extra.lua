return {
  -- HTML closing tags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  -- Contextual information for the current cursor position.
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup {
        -- Configuration options for autoclose.nvim
        -- Example options:
        -- enable = true, -- Ensure the plugin is enabled
      }
    end,
  },
  -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
}
