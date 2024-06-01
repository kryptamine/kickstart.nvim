return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        handlers = {
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 6133 },
        },
        settings = {
          expose_as_code_action = 'all',
          tsserver_max_memory = 'auto',
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          tsserver_file_preferences = {
            importModuleSpecifierPreference = 'non-relative',
          },
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
        },
      }
      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWritePre', {
        pattern = '*.ts,*.tsx,*.jsx,*.js',
        callback = function()
          vim.cmd 'TSToolsAddMissingImports sync'
        end,
      })
    end,
  },
}
