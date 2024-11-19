return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    lazy = false,
    event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
    opts = function()
      -- Function to get the root directory name
      local function get_root_dir()
        local cwd = vim.fn.getcwd()
        local project_name = vim.fn.fnamemodify(cwd, ':t')
        return project_name
      end

      return {
        options = {
          theme = 'auto',
          globalstatus = true,
          disabled_filetypes = {
            statusline = { 'dashboard', 'alpha', 'starter', 'snacks_dashboard' },
          },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            {
              function()
                return ''
              end,
              padding = { left = 1, right = 0 },
              separator = '',
            },
            'mode',
          },
          lualine_b = {
            {
              function()
                local icon = require('config.icons').ui.Project
                return icon .. ' ' .. get_root_dir()
              end,
            },
            'branch',
          },
          lualine_c = {
            { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ' } },
            { 'searchcount' },
          },
          lualine_x = {
            'diff',
          },
          lualine_y = { 'progress' },
          lualine_z = {
            { 'location', separator = '' },
            {
              function()
                return ''
              end,
              padding = { left = 0, right = 1 },
            },
          },
        },
      }
    end,
  },
}
