return {
	{
		"neovim/nvim-lspconfig",
		-- disable <C-k> shortcut for LuaSnip plugin
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			-- need to explicitly specify mode if shortcut is not binded to "normal mode"
			-- https://github.com/LazyVim/LazyVim/discussions/266
			keys[#keys + 1] = { "<C-k>", false, mode = "i" }
		end,
		-- disable "tsserver" formatting
		-- https://github.com/LazyVim/LazyVim/discussions/242
		opts = {
			setup = {
				tsserver = function()
					require("lazyvim.util").lsp.on_attach(function(client)
						if client.name == "tsserver" then
							client.server_capabilities.documentFormattingProvider = false
						end
					end)
				end,
			},
		},
	},
}
