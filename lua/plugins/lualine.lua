return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'meuter/lualine-so-fancy.nvim',
    },
    enabled = true,
    lazy = false,
    event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require 'lualine_require'
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      -- Function to get the root directory name
      local function get_root_dir()
        local cwd = vim.fn.getcwd()
        local project_name = vim.fn.fnamemodify(cwd, ':t')
        return project_name
      end

      return {
        options = {
          theme = 'gruvbox_dark',
          globalstatus = true,
          disabled_filetypes = {
            statusline = { 'dashboard', 'alpha', 'starter' },
          },
        },
        sections = {
          lualine_a = {
            { 'fancy_mode', width = 3 },
          },
          lualine_b = {
            {
              function()
                local icon = require('config.icons').ui.Project
                return icon .. ' ' .. get_root_dir()
              end,
            },
            'fancy_branch',
          },
          lualine_c = {
            { 'fancy_diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ' } },
            { 'fancy_searchcount' },
          },
          lualine_x = {
            'fancy_diff',
            'progress',
          },
          lualine_y = {},
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
