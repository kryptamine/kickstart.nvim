return {
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPost', 'BufNewFile', 'StdinReadPost' },
    opts = {
      symbol = '│',
      options = { try_as_border = true },
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
        priority = 12,
        delay = 0,
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
          'lazy',
          'mason',
          'fzf',
          'dirbuf',
          'terminal',
          'fzf-lua',
          'fzflua',
          'megaterm',
          'nofile',
          'terminal',
          'lsp-installer',
          'SidebarNvim',
          'lspinfo',
          'markdown',
          'help',
          'startify',
          'oil',
          'DirBuf',
          'markdown',
          'help',
          'alpha',
          'dashboard',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'oil_preview',
          'norg',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
