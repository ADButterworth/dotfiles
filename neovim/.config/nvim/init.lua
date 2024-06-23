local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then

	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",

		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " 
vim.g.maplocalleader = "\\"

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
	{"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end
},
{
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
},
"itchyny/lightline.vim",
"hachy/nvf.nvim",
{ 
	"catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000 
},
"williamboman/mason.nvim"
})

-- SETUPS
require("which-key").setup{}
require("mason").setup()

-- EDITOR SETTINGS 
vim.api.nvim_set_keymap("n", " ", "", { noremap = true, silent = true }) -- turns off the annoying cursor movement when space is the leader
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- this and the prev mean we ignore case in searches unless the search has upper case letters
vim.opt.hlsearch = false -- also don't continue to highlight search results, really annoying
vim.opt.tabstop = 3 -- this was called psychopath behaviour for not being an even number, I don't care I like it
vim.opt.expandtab = false
vim.opt.relativenumber = true
vim.opt.showmode = false -- it's in the status line 
vim.opt.scrolloff = 10
vim.opt.cursorline = true

-- SET COLOUR SCHEME
vim.g.lightline = {colorscheme = "catppuccin"} -- set lightline to use the catppuccin theme
vim.cmd.colorscheme "catppuccin"

-- SET KEYBINDS
vim.keymap.set("n", "<leader>f", "<Cmd>Nvf<CR>")
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<CR>")
vim.keymap.set("n", "<leader>l", "<Cmd>Lazy<CR>")
