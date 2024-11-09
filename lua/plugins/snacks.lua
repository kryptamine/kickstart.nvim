return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = false },
      bufdelete = { enabled = false },
      terminal = {
        enabled = true,
        win = {
          position = 'float',
          border = 'single',
        },
      },
      words = {
        enabled = true, -- enable/disable the plugin
        debounce = 200, -- time in ms to wait before updating
        notify_jump = false, -- show a notification when jumping
        notify_end = true, -- show a notification when reaching the end
        foldopen = true, -- open folds after jumping
        jumplist = true, -- set jump point before jumping
        modes = { 'n' }, -- modes to show references
      },
    },
    keys = {
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
      },
      {
        '<leader>gf',
        function()
          Snacks.lazygit.log_file()
        end,
        desc = 'Lazygit Current File History',
      },
      {
        '<leader>gl',
        function()
          Snacks.lazygit.log()
        end,
        desc = 'Lazygit Log (cwd)',
      },
      {
        '<c-t>',
        function()
          Snacks.terminal.toggle()
        end,
        desc = 'Toggle Terminal',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
      },
    },
  },
}
