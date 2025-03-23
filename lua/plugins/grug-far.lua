return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    keys = {
      {
        '<C-f>',
        function()
          require('grug-far').open { transient = true }
        end,
        desc = 'Find/replace',
        mode = { 'n', 'x' },
      },
    },
    opts = {
      openTargetWindow = {
        preferredLocation = 'right',
      },
      keymaps = {
        openNextLocation = { n = '>' },
        openPrevLocation = { n = '<' },
        close = { n = 'q' },
      },
    },
  },
}
