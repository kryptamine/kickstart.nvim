return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.5
        end
      end,
      open_mapping = '<c-t>',
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      direction = 'vertical', -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true,
      -- function to run on opening the terminal
      on_open = function()
        vim.cmd 'startinsert!'
      end,
    }
  end,
}
