return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			vim.o.foldcolumn = "1" -- '0' does not show the fold column, higher values increase the width
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local ufo = require("ufo")

			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})

			-- keymaps
			-- NOTE: I'm only using "zf" for toggling folds where code
			-- gets on my way and don't need separate
			-- keybindings to open/close all/single folds.
			vim.keymap.set("n", "zf", "za")
		end,
	},
}
