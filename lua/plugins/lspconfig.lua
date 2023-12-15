return {
	"neovim/nvim-lspconfig",
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()

		-- need to explicitly specify mode if it's not "normal mode"
		-- https://github.com/LazyVim/LazyVim/discussions/266
		keys[#keys + 1] = { "<C-k>", false, mode = "i" }
	end,
}
