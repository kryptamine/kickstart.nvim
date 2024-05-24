local prettier_langs = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  'css',
  'html',
  'json',
}

local options = {
  -- log_level = vim.log.levels.DEBUG,
  format_after_save = {
    lsp_fallback = true,
    async = true,
  },

  formatters_by_ft = {
    lua = { 'stylua' },
  },

  formatters = {},
}

for _, lang in ipairs(prettier_langs) do
  options.formatters_by_ft[lang] = { 'prettier' }
end

return {
  'stevearc/conform.nvim',
  opts = options,
}
