local notify = require 'notify'

-- Table to store the last visited time for each terminal buffer
local terminal_buffers = {}

-- Function to update the last visited time for a terminal buffer
local function update_terminal_buffer_time()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].buftype == 'terminal' then
    -- Hide the terminal from the buffer list
    vim.bo[bufnr].bufhidden = 'hide'
    vim.bo[bufnr].buflisted = false
    terminal_buffers[bufnr] = os.time()
  end
end

-- Autocommand to update the last visited time when entering a terminal buffer
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*',
  callback = update_terminal_buffer_time,
})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = update_terminal_buffer_time,
})

-- Function to find the most recently visited terminal buffer
local function find_most_recent_terminal_buffer()
  local most_recent_bufnr = nil
  local most_recent_time = 0
  for bufnr, last_visited in pairs(terminal_buffers) do
    if last_visited > most_recent_time then
      most_recent_time = last_visited
      most_recent_bufnr = bufnr
    end
  end
  return most_recent_bufnr
end

-- Function to toggle the terminal in a vertical split
local function toggle_term()
  local current_bufnr = vim.api.nvim_get_current_buf()

  -- Case 1: If the current buffer is a terminal, close the split
  if vim.bo[current_bufnr].buftype == 'terminal' then
    vim.api.nvim_command 'close'
    return
  end

  -- Case 2: Find the most recent terminal buffer
  local bufnr = find_most_recent_terminal_buffer()

  -- If no terminal exists, create a new one in a vertical split
  if bufnr == nil or not vim.api.nvim_buf_is_loaded(bufnr) then
    notify('New terminal in vertical split', 'info', { title = 'terminals.lua', timeout = 150 })
    vim.api.nvim_command 'vsplit | terminal'
    vim.api.nvim_command 'startinsert'
    return
  end

  -- Case 3: In a non-terminal, go to the most recent terminal in a vertical split
  vim.api.nvim_command 'vsplit'
  vim.api.nvim_set_current_buf(bufnr)
  vim.api.nvim_command 'startinsert'
end

vim.keymap.set({ 'n', 'v', 'i', 't' }, '<c-t>', toggle_term)
