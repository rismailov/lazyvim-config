-- default nvim-cmp config from LazyVim modified to get rid of some dependencies
-- and change params for some sources
return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()

		-- make nvim-cmp work with autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					entry_filter = function(entry)
						local kind = cmp.lsp.CompletionItemKind[entry:get_kind()]

						-- disable "Text" and "Keyword" suggestions
						-- NOTE: also commented "buffer" source below and removed it from deps (cmp-buffer)
						-- https://github.com/hrsh7th/nvim-cmp/pull/1067
						return kind ~= "Text" and kind ~= "Keyword"
					end,
				},
				{ name = "path" },
				{
					name = "luasnip",
					priority = 100,
					-- disable luasnip suggestions inside of strings and comments
					entry_filter = function()
						local context = require("cmp.config.context")
						local string_ctx = context.in_treesitter_capture("string") or context.in_syntax_group("String")
						local comment_ctx = context.in_treesitter_capture("comment")
							or context.in_syntax_group("Comment")

						--   Returning `true` will keep the entry, while returning `false` will remove it.
						return not string_ctx and not comment_ctx
					end,
				},
			}, {
				-- { name = "buffer" },
			}),
			formatting = {
				format = function(_, item)
					local icons = require("lazyvim.config").icons.kinds
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			sorting = defaults.sorting,
		}
	end,

	---@param opts cmp.ConfigSchema
	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end
		require("cmp").setup(opts)
	end,
}
