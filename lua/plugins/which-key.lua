return {
  {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup {
        win = {
          border = 'single', -- none, single, double, shadow
        },
      }
    end,
  },
}
