return {
  {
    'dnlhc/glance.nvim',
    cmd = 'Glance',
    keys = {
      { 'gpd', '<cmd>Glance definitions<CR>' },
      { 'gpr', '<cmd>Glance references<CR>' },
      { 'gpy', '<cmd>Glance type_definitions<CR>' },
      { 'gpi', '<cmd>Glance implementations<CR>' },
    },
    opts = function()
      local actions = require('glance').actions
      return {
        mappings = {
          list = {
            ['<C-u>'] = actions.preview_scroll_win(5),
            ['<C-d>'] = actions.preview_scroll_win(-5),
            ['<C-v>'] = actions.jump_vsplit,
            ['p'] = actions.enter_win 'preview',
          },
          preview = {
            ['q'] = actions.close,
            ['p'] = actions.enter_win 'list',
          },
        },
      }
    end,
  },
}
