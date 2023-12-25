return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			-- open newly created file (via nvim-tree) in insert mode
			local api = require("nvim-tree.api")
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. file.fname)
				-- vim.cmd("startinsert")
			end)

			-- update focused file
			local opts = {
				update_focused_file = { enable = true },
				view = { adaptive_size = true },
				-- whether or not to show gitignore-d files
				-- this is true by default
				git = { ignore = false },
				-- specify minimum notification level
				-- e.g. only notify on warnings
				notify = {
					threshold = vim.log.levels.WARN,
				},
			}

			return opts
		end,
	},
}
