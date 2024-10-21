return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Add Cursor Down'] = '<M-j>',
        ['Add Cursor Up'] = '<M-k>',
      }
    end,
  },
}
