return {
  'dzfrias/arena.nvim',
  event = 'BufWinEnter',
  config = function()
    vim.keymap.set('n', '<leader>h', require('arena').toggle, { desc = 'Open Arena' })

    require('arena').setup {
      ignore_current = true,
      max_items = 10,
    }
  end,
}
