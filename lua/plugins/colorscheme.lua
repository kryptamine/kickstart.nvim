return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    lazy     = false,
    config   = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        terminal_colors = true,
      })
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },
}
