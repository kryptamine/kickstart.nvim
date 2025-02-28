return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    init = function()
      vim.schedule(function()
        local get_option = vim.filetype.get_option

        get_option = get_option and get_option
          or function(filetype, option)
            return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring() or get_option(filetype, option)
          end
      end)
    end,
  },
}
