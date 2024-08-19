return {
  'dinhhuy258/git.nvim',
  config = function()
    require('git').setup {
      default_mappings = false,

      keymaps = {
        -- Open blame window
        blame = '<Leader>b',
        -- Close blame window
        quit_blame = 'q',
        -- Open blame commit
        blame_commit = 'o',
        -- Quit blame commit
        quit_blame_commit = 'q',
      },
    }
  end,
}
