return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>-',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open the file manager',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        function()
          require('yazi').yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open the file manager in nvim's working directory",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
    },
  },
}
