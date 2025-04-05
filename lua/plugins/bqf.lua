local function setup()
  local function toggleQf()
    local ft = vim.bo.filetype
    if ft == 'qf' then
      vim.cmd.cclose()
    else
      vim.cmd.copen()
    end
  end

  vim.keymap.set('n', '<leader>x', toggleQf, { desc = 'Toggle quickfi[x]' })

  require('bqf').setup {
    preview = {
      winblend = 0,
      border = 'single',
    },
  }
end

return {
  'kevinhwang91/nvim-bqf',
  dependencies = {
    {
      'junegunn/fzf',
      run = function()
        vim.fn['fzf#install']()
      end,
    },
  },
  config = setup,
}
