local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- PHP snippets
ls.add_snippets("php", {
	-- function
	s(
		"func",
		fmt(
			-- stylua: ignore start
			[[
                {}function {}({})
                {{
                    {}
                }}
            ]],
			-- stylua: ignore end
			{
				c(1, { t("public "), t("private "), t("") }),
				i(2),
				i(3),
				i(0),
			}
		)
	),

	-- Laravel model protected field
	s(
		"pro",
		fmt(
			-- stylua: ignore start
			[[
                protected {} = [
                    {}
                ];
            ]],
			-- stylua: ignore end
			{
				c(1, { t("$fillable"), t("$casts"), t("$hidden") }),
				i(0),
			}
		)
	),
})
