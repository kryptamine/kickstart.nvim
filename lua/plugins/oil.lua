return {
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        columns = { 'icon' },
        keymaps = {
          ['<Esc><Esc>'] = 'actions.close',
          ['<C-v>'] = 'actions.select_vsplit',
          ['<C-s>'] = false,
        },
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git' or name == '.DS_Store'
          end,
        },
        float = {
          -- Padding around the floating window
          padding = 10,
          max_width = 80,
          max_height = 0,
          border = 'rounded',
          win_options = {
            wrap = true,
            winblend = 0,
          },
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', require('oil').toggle_float, { desc = 'Open oil' })
    end,
  },
}
