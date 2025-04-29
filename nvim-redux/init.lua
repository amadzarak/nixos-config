-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
end)

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
       
vim.opt.wrap = false
       
vim.opt.incsearch = true -- incremental search

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- WHITESPACE CHARACTERS
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end


local nvimTreeFocusOrToggle = function ()
	local nvimTree=require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus()
	end
end

-- vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<C-h>", nvimTreeFocusOrToggle)

require("config.lazy")
