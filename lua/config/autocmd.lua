-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})

-- Draw the border for LSP floating windows
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

    vim.cmd 'highlight Winbar guibg=none'
  end,
})

-- don't auto comment new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Start terminal in insert mode.
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('bufcheck', { clear = true }),
  pattern = '*',
  command = 'startinsert | set winfixheight',
})

-- close some filetypes with <esc>
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_esc', { clear = true }),
  pattern = {
    'oil',
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'startuptime',
    'checkhealth',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', '<esc>', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Disable line numbers in terminal windows.
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
