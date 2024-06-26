local keymap = vim.keymap

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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

-- Better ESC
keymap.set('i', 'jj', '<Esc>')

-- Split window
keymap.set('n', 'ss', ':split<Return>', { desc = 'Split botton' })
keymap.set('n', 'sv', ':vsplit<Return>', { desc = 'Split vertically' })

-- Split terminal windows
keymap.set('n', 'st', ':vsplit | term<Return>')

-- save opened buffers
keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>wa<cr><esc>', { desc = 'Save File' })

-- quit
keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { desc = 'Quit all' })

-- LSP
keymap.set('n', '<leader>b', vim.lsp.buf.hover, { desc = 'Display variable type' })

-- Better delete.
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })
