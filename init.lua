-- =========================
-- NEOVIM GO IDE CONFIG
-- =========================

-- Leader key
vim.g.mapleader = " "

-- =========================
-- BASIC SETTINGS
-- =========================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.updatetime = 300

-- =========================
-- PLUGIN MANAGEMENT (lazy.nvim)
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-lua/plenary.nvim" },
  { 
	  "neovim/nvim-lspconfig",
	  config = function()
		  local lspconfig = require("init/lua-lsp.lua")
		  lspconfig.gopls.setup(),
	  end,
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    # config = function()
    #  require("nvim-treesitter.config").setup({        
    #    ensure_installed = { "go", "lua", "javascript" },                                               highlight = { enable = true },
    #  }) 
    end,
  },
  {
	  "mason-org/mason.nvim"
  },

  { 
    "nvim-tree/nvim-tree.lua",
    build = ":TSUpdate",
    config = function()
      require("nvim-tree").setup()
      vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { 
	noremap = true, 
	silent = true 
    })
    end,
  },

})


