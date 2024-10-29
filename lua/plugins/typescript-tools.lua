return {
  {
    'pmizio/typescript-tools.nvim',
    event = 'BufEnter',
    config = function()
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue',
        },
        settings = {
          expose_as_code_action = 'all',
          tsserver_file_preferences = {
            importModuleSpecifierPreference = 'non-relative',
            providePrefixAndSuffixTextForRename = false,
          },
          separate_diagnostic_server = true,
          publish_diagnostic_on = 'insert_leave',
        },
        handlers = {
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 6133 },
        },
      }
    end,
  },
}
