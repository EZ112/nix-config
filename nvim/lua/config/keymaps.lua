local map = vim.keymap.set

-- navigation
map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

-- line number
map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'toggle line number' })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'toggle relative number' })

-- comment
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })

-- nvimtree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- dropbar
local dropbar_api = require('dropbar.api')
map('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })

-- telescope
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fw', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>gt', telescope_builtin.git_status, { desc = 'Telescope git status' })
map('n', '<leader>gm', telescope_builtin.git_commits, { desc = 'Telescope git commits' })
map('n', '<leader>gbr', telescope_builtin.git_branches, { desc = 'Telescope git branches' })
map('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- auto session
map('n', '<leader>sd', '<cmd>AutoSession deletePicker<CR>', { desc = 'Session delete picker' })

-- code action
local code_action = require('tiny-code-action').code_action
map('n', '<leader>ca', code_action, { desc = 'Code Action', noremap = true, silent = true })

-- gitsigns
local gitsigns = require('gitsigns')
map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = 'Next hunk' })
map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = 'Prev hunk' })
map('n', '<leader>gbm', gitsigns.blame, { desc = 'Git blame' })

-- harpoon
local harpoon = require('harpoon')
map('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon add' })
map('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon list' })
map('n', '<C-j>', function()
  harpoon:list():next()
end)
map('n', '<C-k>', function()
  harpoon:list():prev()
end)

-- flash
map({ 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'Flash' })
map({ 'n', 'x', 'o' }, 'S', require('flash').treesitter, { desc = 'Flash Treesitter' })
map('o', 'r', require('flash').remote, { desc = 'Remote Flash' })
map({ 'o', 'x' }, 'R', require('flash').treesitter_search, { desc = 'Treesitter Search' })
map('c', '<c-s>', require('flash').toggle, { desc = 'Toggle Flash Search' })

-- lsp
map('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP go to definition' })
