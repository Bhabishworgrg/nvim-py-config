local set = vim.keymap.set
local cmd = vim.cmd

-- Nvim
set('n', '<leader>e', cmd.Ex)						-- open netrw explorer

-- Telescope
local builtin = require('telescope.builtin')
set('n', '<leader><leader>', builtin.find_files)	-- search files
set('n', '<leader>f', builtin.live_grep)			-- search inside of files
set('n', '<leader>c', vim.lsp.buf.code_action)		-- show code actions
set('n', '<leader>d', vim.diagnostic.open_float)	-- show error/warning message
set('n', '<leader>h',
	require('telescope').extensions.git_file_history.git_file_history
) -- show git file history

-- Fugitive
set('n', '<leader>g', cmd.Git)						-- show git status

-- Flog
set('n', '<leader>l', cmd.Flogsplit)				-- open flog window

-- Undotree
set('n', '<leader>u', function()
	cmd.UndotreeShow() cmd.UndotreeFocus()			-- open undotree window
end)

-- Gitsigns
local gitsigns = require('gitsigns')
set('n', '<leader>j', gitsigns.next_hunk)			-- next hunk
set('n', '<leader>k', gitsigns.prev_hunk)			-- previous hunk
set('n', '<leader>b', gitsigns.blame)				-- git blame

-- Netrw Tabs
set('n', '<leader>n', cmd.tabnew)					-- open new tab
set('n', '<Tab>', cmd.tabnext)						-- next tab
set('n', '<S-Tab>', cmd.tabprevious) 				-- previous tab

-- Window Navigation
set('n', '<C-h>', '<C-w>h')							-- move to left window
set('n', '<C-j>', '<C-w>j')							-- move to bottom window
set('n', '<C-k>', '<C-w>k')							-- move to top window
set('n', '<C-l>', '<C-w>l')							-- move to right window

