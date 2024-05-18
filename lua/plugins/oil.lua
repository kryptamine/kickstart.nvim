return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['<Esc><Esc>'] = 'actions.close',
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          -- Padding around the floating window
          padding = 30,
          max_width = 0,
          max_height = 0,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', require('oil').toggle_float, { desc = 'Open oil' })
    end,
  },
}
