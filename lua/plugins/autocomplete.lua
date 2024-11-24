return {
  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    opts = {
      keymap = {
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      sources = {
        providers = {
          buffer = {
            fallback_for = {},
            max_items = 4,
            min_keyword_length = 1,
            score_offset = -3,
          },
        },
      },
      highlight = {
        use_nvim_cmp_as_default = false,
      },
    },
  },
}
