return {
	"stevearc/conform.nvim",
	-- opts = {
	-- 	formatters_by_ft = {
	-- 		php = { "php_cs_fixer" },
	-- 	},
	-- },
	opts = function()
		-- local conform = require("conform")

		local function setFormat(filetypes, formatter)
			local config = {}
			for _, filetype in ipairs(filetypes) do
				config[filetype] = { formatter }
			end
			return config
		end

		local config = {
			lua = { "stylua" },
			python = { "black" },
			php = { "php_cs_fixer" },
		}

		config = vim.tbl_extend(
			"keep",
			config,
			setFormat({
				"scss",
				"jsonc",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"html",
				"markdown",
				"css",
				"yaml",
				"json",
				"YAML",
				"toml",
			}, "prettierd")
		)

		local opts = {
			formatters_by_ft = config,
		}

		return opts
	end,
}
