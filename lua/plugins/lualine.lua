return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    lazy = false,
    event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
    opts = function()
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
            'branch',
            {
              'filename',
              path = 1,
              padding = { left = 1, right = 1 },
              fmt = function(name)
                local icon = '󰈙 '
                return icon .. name
              end,
            },
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
