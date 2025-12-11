return {{
	'nvim-treesitter/nvim-treesitter',
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })()
	end,
	config = function ()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			ensure_installed = { 'bash', 'lua', 'python' },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
},
		'nvim-treesitter/playground',
}
