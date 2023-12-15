return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			-- open newly created file (via nvim-tree) in insert mode
			local api = require("nvim-tree.api")
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. file.fname)
				vim.cmd("startinsert")
			end)

			-- update focused file
			local opts = {
				update_focused_file = { enable = true },
			}

			return opts
		end,
	},
}
