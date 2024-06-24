local function setup()
  local function toggleQf()
    local ft = vim.bo.filetype
    if ft == 'qf' then
      vim.cmd.cclose()
    else
      vim.cmd.copen()
    end
  end

  vim.keymap.set('n', '<leader>x', toggleQf, { desc = 'Toggle quickfix' })
  vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix' })
  vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix' })

  require('bqf').setup {
    border = 'rounded',
    preview = {
      description = 'Make BQF opaque',
      winblend = 0,
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
