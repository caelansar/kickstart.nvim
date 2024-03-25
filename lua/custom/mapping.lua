vim.keymap.set('n', '<leader>e', ':Neotree reveal toggle<CR>', { desc = 'Open [E]xplore' })

vim.opt.guicursor = {
  'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
  'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
  'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100',
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

-- Move to window using the <opt> hjkl keys
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

function pick()
  local picker = require 'window-picker'
  local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end

-- vim.keymap.set('n', ',m', "<cmd> lua require ('window-picker').pick_window()<cr>", { desc = 'Pick window', remap = false })
vim.keymap.set('n', '<leader>.', '<cmd>lua pick()<cr>', { desc = 'Pick a window' })

vim.keymap.set('i', 'jk', '<Esc>')
