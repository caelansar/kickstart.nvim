return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {
    --   's1n7ax/nvim-window-picker',
    --   version = '2.*',
    --   config = function()
    --     require('window-picker').setup {
    --       selection_chars = 'ABCDEFGHIJKLMN',
    --
    --       filter_rules = {
    --         include_current_win = false,
    --         autoselect_one = true,
    --         -- filter using buffer options
    --         bo = {
    --           -- if the file type is one of following, the window will be ignored
    --           filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
    --           -- if the buffer type is one of following, the window will be ignored
    --           buftype = { 'terminal', 'quickfix' },
    --         },
    --       },
    --     }
    --   end,
    -- },
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    require('neo-tree').setup {
      window = {
        position = 'left',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['l'] = 'open',
          ['O'] = 'system_open',
          ['h'] = 'close_node',
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          path = vim.fn.shellescape(path, 1)
          if vim.fn.has 'mac' ~= 0 then
            vim.cmd('silent !open ' .. path)
          end
        end,
      },
    }
  end,
}
