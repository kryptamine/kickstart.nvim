return {
  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    opts = {
      keymap = {
        show = '<C-space>',
        hide = '<C-e>',
        accept = '<CR>',
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
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
  },
}
