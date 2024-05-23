return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'm4xshen/autoclose.nvim',

    --context
    'nvim-treesitter/nvim-treesitter-context',
  },

  build = ':TSUpdate',
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {},
        modules = {},
        autotag = {
          enable = true,
          enable_close_on_slash = false,
        },
        auto_install = true,
        sync_install = false,
        ignore_install = {},

        indent = { enable = true },
        highlight = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['ia'] = '@attribute.inner',
              ['aa'] = '@attribute.outer',
              ['ap'] = '@parameter.outer',
              ['ip'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end, 0)
    require('treesitter-context').setup {
      max_lines = 1,
    }

    vim.treesitter.language.register('markdown', 'mdx')

    --angular
    require('autoclose').setup()
    require('nvim-ts-autotag').setup {
      filetypes = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'tsx',
        'jsx',
        'rescript',
        'xml',
        'php',
        'markdown',
        'astro',
        'glimmer',
        'handlebars',
        'hbs',
      },
    }
  end,
}
