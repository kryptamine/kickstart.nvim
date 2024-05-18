return {
  {
    'echasnovski/mini.indentscope',
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
          'oil-confirm',
          'oil',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
