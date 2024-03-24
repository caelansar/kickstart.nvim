return {
  {
    'nyngwang/NeoZoom.lua',
    lazy = true,
    keys = {
      {
        '<leader>z',
        function()
          vim.cmd 'NeoZoomToggle'
        end,
        desc = 'Neo[Z]oom Toggle',
      },
    },
    opts = {
      scrolloff_on_enter = 7,
      exclude_buftypes = { 'terminal' },
      winopts = {
        offset = {
          -- Omit `top` and/or `left` to center the floating window
          width = 150,
          height = 0.85,
        },
      },
    },
  },
}
