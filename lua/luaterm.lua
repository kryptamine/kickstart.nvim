local lua_terminal_window = nil
local lua_terminal_buffer = nil

local function LuaTerminalOpen()
  if vim.fn.bufexists(lua_terminal_buffer) == 0 then
    vim.api.nvim_command 'vsplit lua_terminal'
    vim.fn.termopen(os.getenv 'SHELL', {
      detach = 1,
    })

    vim.api.nvim_command 'silent file Terminal 1'
    lua_terminal_window = vim.fn.win_getid()
    lua_terminal_buffer = vim.fn.bufnr '%'
    vim.opt.buflisted = false
  else
    if vim.fn.win_gotoid(lua_terminal_window) == 0 then
      vim.api.nvim_command 'vsplit'
      vim.api.nvim_command 'buffer Terminal 1'
      lua_terminal_window = vim.fn.win_getid()
    end
  end
  vim.cmd 'startinsert'
end

local function LuaTerminalClose()
  if vim.fn.win_gotoid(lua_terminal_window) == 1 then
    vim.api.nvim_command 'hide'
  end
end

local function LuaTerminalToggle()
  if vim.fn.win_gotoid(lua_terminal_window) == 1 then
    LuaTerminalClose()
  else
    LuaTerminalOpen()
  end
end

vim.keymap.set({ 'n', 'v', 'i', 't' }, '<c-t>', LuaTerminalToggle)
