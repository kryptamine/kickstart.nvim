return {
  {
    'doums/darcula',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    lazy     = false,
    config   = function()
      vim.cmd.colorscheme('darcula')
    end,
  },
}
