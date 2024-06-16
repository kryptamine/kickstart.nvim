return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Add Cursor Down'] = '<M-C-Down>',
        ['Add Cursor Up'] = '<M-C-Up>',
      }
      vim.g.VM_theme = 'codedark'
    end,
  },
}
