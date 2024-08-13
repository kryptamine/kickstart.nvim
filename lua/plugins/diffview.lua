return {
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    opts = {
      enhanced_diff_hl = true,
      show_help_hints = false,
    },
    keys = {
      { '<leader>jj', '<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>' },
    },
  },
}
