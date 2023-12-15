return {
	-- themes
	-- { "shaunsingh/nord.nvim" },
	{ "catppuccin/nvim" },
	-- { "AlexvZyl/nordic.nvim" },
	{ "rose-pine/neovim" },

	-- Configure LazyVim to load the theme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
			-- colorscheme = "catppuccin",
			-- colorscheme = "nord",
		},
	},
}
