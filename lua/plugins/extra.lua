return {
  -- HTML closing tags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {
      check_ts = true, -- treesitter integration
      disable_filetype = { 'TelescopePrompt', 'terminal' },
    },
  },
  -- Contextual information for the current cursor position.
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
}
