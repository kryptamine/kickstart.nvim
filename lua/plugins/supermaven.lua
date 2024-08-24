return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<c-a>',
        },
        log_level = 'off', -- set to "off" to disable logging completely
      }
    end,
  },
}
