return {
	"L3MON4D3/LuaSnip",
	keys = {},
	opts = function()
		-- https://www.youtube.com/watch?v=Dn800rlPIho&t=615s
		local ls = require("luasnip")
		local parse = require("luasnip.util.parser").parse_snippet

		ls.snippets = {
			all = {},
			lua = {
				-- parse("lf", "local $1 = function($2)\n $0\nend"),
				-- parse("expand", "-- this is what got expanded"),
			},
		}

		local opts = {
			update_events = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		}

		return opts
	end,
}
