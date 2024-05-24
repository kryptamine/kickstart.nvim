return {
  {
    'windwp/nvim-ts-autotag',
    opts = {},
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
}
