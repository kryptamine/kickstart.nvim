return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
      }
      vim.g.VM_theme = 'codedark'
    end,
  },
}
