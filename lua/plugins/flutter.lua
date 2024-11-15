return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        dev_log = {
          -- toggle it when you run without DAP
          enabled = true,
          open_cmd = 'tabedit',
        },
      }
    end,
  },
}
