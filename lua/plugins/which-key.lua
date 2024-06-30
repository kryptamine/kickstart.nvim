return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        icons = {
          breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
          separator = require('config.icons').ui.BoldArrowRight, -- symbol used between a key and it's label
          group = '+', -- symbol prepended to a group
        },
        window = {
          border = 'single', -- none, single, double, shadow
          position = 'bottom', -- bottom, top
          zindex = 1000, -- positive value to position WhichKey above other floating windows.
        },
        layout = {
          spacing = 3, -- spacing between columns
          align = 'left', -- align columns left, center or right
        },
      }

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]azy Git', _ = 'which_key_ignore' },
        ['<leader>q'] = { name = '[Q]uit File', _ = 'which_key_ignore' },
        ['<leader>Q'] = { name = '[Q]uit Vim', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>g'] = { '[G]it Hunk' },
      }, { mode = 'v' })
    end,
  },
}
