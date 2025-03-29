local keymap = vim.keymap

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Better H,J,K,L
keymap.set('n', 'H', '^')
keymap.set('n', 'J', '}')
keymap.set('n', 'K', '{')
keymap.set('n', 'L', '$')

local opts = { noremap = true, silent = true }

-- save opened buffers
keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>wa<cr><esc>', { desc = 'Save open buffers' })

-- quit
keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { desc = 'Quit all' })

-- Better delete.
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })

-- Fix backspace.
keymap.set({ 't' }, '<S-BS>', '<bs>', opts)

-- Move lines up and down.
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Better ESC
keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Paste options
keymap.set('v', 'p', '"_dP', { desc = 'Paste Without Overwriting' })

-- Change text without putting it into the vim register,
keymap.set('n', 'c', '"_c')
keymap.set('n', 'C', '"_C')
keymap.set('n', 'cc', '"_cc')
keymap.set('x', 'c', '"_c')

-- Deleting without yanking empty line
keymap.set('n', 'dd', function()
  local is_empty_line = vim.api.nvim_get_current_line():match '^%s*$'
  if is_empty_line then
    return '"_dd'
  else
    return 'dd'
  end
end, { noremap = true, expr = true, desc = "Don't Yank Empty Line to Clipboard" })

-- Snacks
keymap.set('t', '<c-t>', function()
  Snacks.terminal.toggle()
end, { desc = 'Toggle Terminal' })
