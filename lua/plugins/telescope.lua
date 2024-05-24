return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require 'telescope'
      local icons = require 'config.icons'
      local actions = require 'telescope.actions'

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'TelescopeResults',
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd('TelescopeParent', '\t\t.*$')
            vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
          end)
        end,
      })

      -- Function to display only the last 5 path segments
      local function filenameFirst(_, path)
        local segments = {}
        for segment in string.gmatch(path, '[^/]+') do
          table.insert(segments, segment)
        end

        local tail = segments[#segments]
        local parent_segments = {}
        for i = math.max(1, #segments - 5), #segments - 1 do
          table.insert(parent_segments, segments[i])
        end

        local parent = table.concat(parent_segments, '/')
        if parent == '' then
          return tail
        end
        return string.format('%s\t\t%s', tail, parent)
      end

      telescope.setup {
        pickers = {
          oldfiles = {
            cwd_only = true,
          },
          find_files = {
            path_display = filenameFirst,
            previewer = false,
            -- path_display = formattedName,
            layout_config = {
              height = 0.4,
              prompt_position = 'top',
              preview_cutoff = 120,
            },
          },
          buffers = {
            path_display = filenameFirst,
            mappings = {
              i = {
                ['<c-d>'] = actions.delete_buffer,
              },
              n = {
                ['<c-d>'] = actions.delete_buffer,
              },
            },
            previewer = false,
            initial_mode = 'normal',
            -- theme = "dropdown",
            layout_config = {
              height = 0.4,
              width = 0.6,
              prompt_position = 'top',
              preview_cutoff = 120,
            },
          },
          live_grep = {
            additional_args = { '--fixed-strings' },
          },
          lsp_references = {
            show_line = false,
            -- Specific options for lsp_references picker
            path_display = filenameFirst,
          },
        },
        defaults = {
          preview = {
            mime_hook = function(filepath, bufnr, opts)
              local is_image = function(fp)
                local image_extensions = { 'png', 'jpg' } -- Supported image formats
                local split_path = vim.split(fp:lower(), '.', { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
              end
              if is_image(filepath) then
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                  for _, d in ipairs(data) do
                    vim.api.nvim_chan_send(term, d .. '\r\n')
                  end
                end
                vim.fn.jobstart({
                  'catimg',
                  filepath, -- Terminal image viewer command
                }, { on_stdout = send_output, stdout_buffered = true, pty = true })
              else
                require('telescope.previewers.utils').set_preview_message(bufnr, opts.winid, 'Binary cannot be previewed')
              end
            end,
          },
          prompt_prefix = ' ' .. icons.ui.Telescope .. ' ',
          selection_caret = icons.ui.BoldArrowRight .. ' ',
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          layout_strategy = 'vertical',
          layout_config = {
            horizontal = {
              preview_width = 0.5,
              preview_cutoff = 100,
            },
            vertical = {
              prompt_position = 'top',
              mirror = true,
            },
          },
          file_ignore_patterns = {
            'codegen.ts',
            '.git',
            'lazy-lock.json',
            '*-lock.yaml',
            'node_modules',
            '%.lock',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {
              previewer = false,
              initial_mode = 'normal',
              sorting_strategy = 'ascending',
              layout_strategy = 'horizontal',
              layout_config = {
                horizontal = {
                  width = 0.5,
                  height = 0.4,
                  preview_width = 0.6,
                },
              },
            },
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      telescope.load_extension 'fzf'
      telescope.load_extension 'ui-select'

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[ ] Find files' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sN', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
