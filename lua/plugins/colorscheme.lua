return {
	-- themes
	{ "catppuccin/nvim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "rose-pine/neovim" },
	{ "rebelot/kanagawa.nvim" },
	{ "Mofiqul/vscode.nvim" },

	-- Configure LazyVim to load the theme
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "catppuccin",
			colorscheme = "nordic",
			-- colorscheme = "rose-pine",
			-- colorscheme = "kanagawa",
			-- colorscheme = "vscode",
		},
	},
}
