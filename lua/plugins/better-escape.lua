-- binds "kj" & "jk" to <Esc> without delay when typing
return {
    "max397574/better-escape.nvim",
    opts = {
        mapping = { "kj", "jk" },
    },
}
