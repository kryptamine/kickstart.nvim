return {
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<Esc><Esc>'] = 'actions.close',
          ['<C-v>'] = 'actions.select_vsplit',
          ['<C-s>'] = false,
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local ignore_list = { '.DS_Store' }
            return vim.tbl_contains(ignore_list, name)
          end,
        },
        float = {
          -- Padding around the floating window
          padding = 10,
          max_width = 80,
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
