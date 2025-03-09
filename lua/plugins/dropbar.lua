return {
  {
    'Bekaboo/dropbar.nvim',
    config = function()
      vim.api.nvim_create_autocmd('BufWinEnter', {
        callback = function()
          local win = vim.api.nvim_get_current_win()
          local config = vim.api.nvim_win_get_config(win)

          -- Check if the current window is floating
          if config.relative ~= '' then
            -- Disable winbar for any floating window
            vim.wo[win].winbar = ''
            vim.w[win].winbar_no_attach = true
          end
        end,
      })
    end,
  },
}
