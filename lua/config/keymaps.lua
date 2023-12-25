-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "Y", "y$", { desc = "Yanks to end of line" })

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { silent = true })
-- vim.keymap.set("n", "z", "<cmd>NvimTreeCollapse<cr>", { silent = true })

-- remove unnessesary key bindings
vim.keymap.del("n", "y")
vim.keymap.del("n", "d")
vim.keymap.del("n", "c")

-- move lines around
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })

-- go to end/start of the line on wrapped text
vim.keymap.set("n", "$", "g$")
vim.keymap.set("n", "0", "g0")

-- remove highlight after search
vim.keymap.set("n", "<C-n>", "<cmd>:nohlsearch<cr>")

-- delete default terminal commands from which-key
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")

-- easier delete (close) current buffer
-- implementation taken from: https://github.com/LazyVim/LazyVim/blob/879e29504d43e9f178d967ecc34d482f902e5a91/lua/lazyvim/plugins/editor.lua#L433-L435
-- vim.keymap.set("n", "<leader>c", function()
-- 	require("mini.bufremove").delete(0, true)
-- end, { desc = "Delete Buffer (Force)" })

-- delete (close) all buffers
-- NOTE: this will also close the buffer with NvimTree, that's why I added
-- second command to reopen it again
vim.keymap.set("n", "<leader>ba", "<cmd>%bd!<cr><cmd>NvimTreeOpen<cr>")

-- easier access to terminal
-- fn taken from: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L143
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>t", function()
	Util.terminal()
end, { desc = "Terminal" })

-- easier quit
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Easier [Q]uit", silent = true })

-- easier save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Easier [W]rite", silent = true })

-------------------------------------------------------------------
--- LuaSnip Start
-------------------------------------------------------------------
local ls = require("luasnip")

-- expand or jump forward within the snippet
-- NOTE: for this to work, Lazyvim's default LSP keyboard shortcut <C-k>
--  in insert mode has to be disabled. @see lspconfig.lua
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable(1) then
		ls.expand_or_jump(1)
	end
end, { silent = true, desc = "LuaSnip: expand/jump forward" })

-- jump back within the snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "LuaSnip: jump back" })

-- cycling through choices within the snippet
vim.keymap.set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true, desc = "LuaSnip: cycle through choices" })
-------------------------------------------------------------------
-------------------------------------------------------------------
--- LuaSnip End

-- deleting useless keymap (scroll forward) to add remap it in LSP
vim.keymap.del("n", "<c-f>")
