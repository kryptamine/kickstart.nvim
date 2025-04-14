return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        ignore_filetypes = { 'oil' },
        keymaps = {
          accept_suggestion = '<c-a>',
        },
        log_level = 'off',
      }
    end,
  },
}
