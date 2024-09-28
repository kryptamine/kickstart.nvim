local prettier_langs = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  'css',
  'html',
  'json',
  'yaml',
  'markdown',
}

local options = {
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 5000,
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    c = { 'clang-format' },
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
