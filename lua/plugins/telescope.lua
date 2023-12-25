return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			file_ignore_patterns = {
				"vendor",
				"node_modules",
				"package-lock.json",
				"yarn.json",
				".next",
			},
		},
	},
}
