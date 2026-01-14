-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none', '--branch=stable',
		'https://github.com/folke/lazy.nvim.git', lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
	spec = { import = 'plugins'	},
	checker = { enabled = true },
})

-- Setup LSP
local cmp = require('cmp')
local default_setup = function(server)
	vim.lsp.config(server,
		{ capabilities = require('cmp_nvim_lsp').default_capabilities() }
	)
end

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'bashls', 'docker_compose_language_service', 'dockerls', 'pyright', 'lua_ls', 'denols', 'cssls', 'html' },	-- servers for autocompletion
	handlers = { default_setup }
})

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' }
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({}),				-- <Enter> key to confirm completion item
		['<C-Space>'] = cmp.mapping.complete(),			-- <Ctrl> + <Space> to trigger completion menu
		['<Tab>'] = cmp.mapping.select_next_item(),		-- <Tab> to select next completion item
		['<S-Tab>'] = cmp.mapping.select_prev_item(),	-- <Shift> + <Tab> to select previous completion item
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

-- Setup web-devicons
local devicons = require('nvim-web-devicons')
devicons.setup {
	variant = 'dark';
}

-- Setup telescope layout and lsp code actions
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		layout_strategy = 'flex',
		layout_config = {
			horizontal = { preview_width = 0.6, width = 0.9, height = 0.9 },
			vertical = { preview_height = 0.7, width = 0.9, height = 0.9 },
		},
		mappings = {
			i = {
				['<C-h>'] = actions.preview_scrolling_left,		-- scroll left preview window
				['<C-l>'] = actions.preview_scrolling_right,	-- scroll right preview window
				['<C-j>'] = actions.preview_scrolling_down,		-- scroll down preview window
				['<C-k>'] = actions.preview_scrolling_up,		-- scroll up preview window
			},
			n = {
				['<C-h>'] = actions.preview_scrolling_left,		-- scroll left preview window
				['<C-l>'] = actions.preview_scrolling_right,	-- scroll right preview window
				['<C-j>'] = actions.preview_scrolling_down,		-- scroll down preview window
				['<C-k>'] = actions.preview_scrolling_up,		-- scroll up preview window
			},
		},
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown{}
		}
	}
})

telescope.load_extension('ui-select')
telescope.load_extension('git_file_history')
