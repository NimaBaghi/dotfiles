local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() 

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance

  use("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'}) -- treesitter configuration
  use('nvim-treesitter/playground')

  use('mbbill/undotree') -- The undo history visualizer

  use('tpope/vim-fugitive') -- Git Wrapper

  -- file explorer
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  -- use("preservim/nerdtree")
  -- use("Xuyuanp/nerdtree-git-plugin")
  -- use("PhilRunninger/nerdtree-visual-selection")
  -- use("PhilRunninger/nerdtree-buffer-ops")
  -- use("ryanoasis/vim-devicons")

  use("ThePrimeagen/vim-be-good") -- practice vim (CMD: :VimBeGood)

  use("airblade/vim-gitgutter") -- git signs 

  use("Yggdroot/indentLine") -- displaying thin vertical lines at each indentation level

  use("ledger/vim-ledger") -- Filetype detection, syntax highlighting, auto-formatting, auto-completion

  -- use("machakann/vim-highlightedyank") -- highlight yank

  use("norcalli/nvim-colorizer.lua") -- Neovim colorizer.

  use("tpope/vim-repeat") -- enable repeating supported plugin maps with "."

  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- use ('romgrk/barbar.nvim') -- tabs tracker
  -- bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  use("nvim-lualine/lualine.nvim") -- statusline

  use {
      "folke/which-key.nvim",
      config = function()
          require("which-key").setup {}
      end
  }

  use("szw/vim-maximizer") -- maximizes and restores current window

  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  use("numToStr/Comment.nvim") -- commenting with gc

  use('theprimeagen/harpoon')
  use("folke/zen-mode.nvim")

  -- ThePrimeagen lsp config
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
          -- {'tzachar/cmp-tabnine' , run='./install.sh'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  --lsp
  -- autocompletion
  -- use("hrsh7th/nvim-cmp") -- completion plugin
  -- use("hrsh7th/cmp-buffer") -- source for text in buffer
  -- use("hrsh7th/cmp-path") -- source for file system paths
  --
  -- -- snippets
  -- use("L3MON4D3/LuaSnip") -- snippet engine
  -- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  -- use("rafamadriz/friendly-snippets") -- useful snippets
  --
  -- -- managing & installing lsp servers, linters & formatters
  -- use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  -- use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
  --
  -- -- configuring lsp servers
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  -- use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  -- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  --
  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  -- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
  
  if packer_bootstrap then
      require("packer").sync()
  end
end)
