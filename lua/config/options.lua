local options = {
  -- mostly just for cmp
  completeopt = { 'menu', 'menuone', 'noselect' },
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  title = true,
  autoindent = true,
  smartindent = true,
  backup = false,
  showcmd = true,
  cmdheight = 0,
  laststatus = 0,
  expandtab = true,
  ignorecase = true,
  smarttab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,
  backspace = { 'start', 'eol', 'indent' },
  splitkeep = 'cursor',
  termguicolors = true,
  -- Don't show the ruler,
  ruler = false,
  -- Make line numbers default,
  number = true,
  -- You can also add relative line numbers, to help with jumping.,
  --  Experiment for yourself to see if you like it!,
  relativenumber = true,
  -- Enable mouse mode, can be useful for resizing splits for example!,
  mouse = 'a',
  -- Don't show the mode, since it's already in the status line,
  showmode = false,
  -- Sync clipboard between OS and Neovim.,
  --  Remove this option if you want your OS clipboard to remain independent.,
  --  See `:help 'clipboard'`,
  clipboard = 'unnamedplus',
  -- Enable break indent,
  breakindent = true,
  -- Save undo history,
  undofile = true,
  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term,
  smartcase = true,
  -- Keep signcolumn on by default,
  signcolumn = 'yes',
  -- Decrease update time,
  updatetime = 250,
  -- Decrease mapped sequence wait time,
  -- Displays which-key popup sooner,
  timeoutlen = 300,
  -- Configure how new splits should be opened,
  splitright = true,
  splitbelow = true,
  -- Sets how neovim will display certain whitespace characters in the editor.,
  --  See `:help 'list'`,
  --  and `:help 'listchars'`,
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  -- Preview substitutions live, as you type!,
  inccommand = 'split',
  -- Show which line your cursor is on,
  cursorline = true,
  cursorlineopt = 'line',
  -- Minimal number of screen lines to keep above and below the cursor.,
  scrolloff = 10,
  -- [[ Basic Keymaps ]],
  --  See `:help vim.keymap.set()`,
  -- Set highlight on search, but clear on pressing <Esc> in normal mode,
  hlsearch = true,

  -- What to save in session.
  sessionoptions = {
    'buffers',
    'curdir',
    'resize',
    'winpos',
    'winsize',
  },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.wildignore:append { '*/node_modules/*' }

-- Add asterisks in block comments,
vim.opt.formatoptions:append { 'r' }
vim.scriptencoding = 'utf-8'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Disable some providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.diagnostic.config {
  signs = true,
  underline = false,
  float = {
    border = 'rounded',
    focusable = true,
  },
}
