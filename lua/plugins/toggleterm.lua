return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        shade_terminals = true,
        direction = "float",
        float_opts = {
          border = "curved",
          winblend = 0,
        },
        winbar = {
          enabled = true,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
        open_mapping = [[\]],
        on_open = function()
          -- Disable troll-stopper highlight
          vim.cmd([[highlight TrollStopper ctermbg = none guibg = none]])
        end,
        on_close = function()
          -- Enable troll-stopper highlight
          vim.cmd([[highlight TrollStopper ctermbg = red guibg = red]])
        end,
      })

      vim.api.nvim_create_user_command("TermNew", function()
        local term = require("toggleterm.terminal").Terminal:new({})
        term:spawn()
        term:toggle()
      end, { bang = true })
    end,
  },
}
