return {
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
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
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        stop_eof = true,
        easing_function = 'sine',
        hide_cursor = true,
        cursor_scrolls_alone = true,
      }
    end,
  },
}
