---------------------------------
-- Plugins
---------------------------------
local packer = require("packer")
vim.cmd([[packadd packer.nvim]])

packer.startup(function()
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	-- Snippet engine
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("petertriho/cmp-git")
	-- Formatting
	use("nvimtools/none-ls.nvim")
	-- Language servers
	use({ "neovim/nvim-lspconfig", tag = "v2.5.0" })
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("simrat39/rust-tools.nvim")
	-- Syntax parser
	use({ "nvim-treesitter/nvim-treesitter", commit = "310f0925" })
	use("wuelnerdotexe/vim-astro")
	-- Plugin manager
	use("wbthomason/packer.nvim")
	-- Utilities
	use("windwp/nvim-autopairs")
	use("norcalli/nvim-colorizer.lua")
	use("lewis6991/gitsigns.nvim")
	-- Dependences needed
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MunifTanjim/nui.nvim")
	-- Finder
	use("nvim-telescope/telescope.nvim")
	-- Interface
	use("akinsho/bufferline.nvim")
	use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })
	use("nvim-lualine/lualine.nvim")
	-- use('elvessousa/sobrio')
end)

---------------------------------
-- Misc plugins
---------------------------------
local function try_setup(module, ...)
	local ok, err = pcall(require, module)
	if ok then
		local opts = ...
		if opts then
			err.setup(opts)
		else
			err.setup()
		end
	else
		vim.notify("plugin not installed: " .. module, vim.log.levels.WARN)
	end
end

-- Autopairs
try_setup("nvim-autopairs", {
	disable_filetype = { "TelescopePrompt" },
})

-- LSP Installer
local mason_ok, mason = pcall(require, "mason")
local mlsp_ok, mlsp = pcall(require, "mason-lspconfig")
if mason_ok then
	mason.setup()
	if mlsp_ok then
		mlsp.setup({
			ensure_installed = { "pyright", "ts_ls", "clangd", "rust_analyzer", "astro", "phpactor" },
			automatic_installation = true,
			automatic_enable = false,
		})
	end
end

-- Colorizer
try_setup("colorizer")

-- Git signs
try_setup("gitsigns")

-- Bufferline
try_setup("bufferline")

-- Lualine
try_setup("lualine")

-- Neo tree
try_setup("neo-tree", {
	-- Close Neo-tree if it is the last window left in the tab
	close_if_last_window = false,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = { width = 30 },
})