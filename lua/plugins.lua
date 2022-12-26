-- Automatically install and setup packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- packer can manage itself
	use('wbthomason/packer.nvim')
	-- Tree sitter
	use{
		  "nvim-treesitter/nvim-treesitter",
		  run = ":TSUpdate",
		  config = function()
			  return require("plugins.treesitter")
		  end 
	}

	use("nvim-treesitter/nvim-treesitter-refactor")
	use("p00f/nvim-ts-rainbow")
	-- Mason
	use{
		'williamboman/mason.nvim',
		config = function() 
			require("plugins.mason")
		end
	}
	
	use{'williamboman/mason-lspconfig.nvim',
		config = function()
			require("plugins.mason-lspconfig")
		end,

		after = "mason.nvim"
	}
	-- LSP CONFIG
	use{
		'neovim/nvim-lspconfig',
		config = function()
			require("plugins.nvim-lspconfig")
		end
	}
	-- RUSTTOOLS
	use{
		'simrat39/rust-tools.nvim',
		config = function()
			require("plugins.rust-tools")
		end 
	}


	-- COMPE
	use('hrsh7th/vim-vsnip')
	use('hrsh7th/vim-vsnip-integ')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use{
		'hrsh7th/nvim-cmp',
		config = function()
			require("plugins.nvim-cmp")
		end
	}
	-- THEME
	use {
		'folke/tokyonight.nvim',
		config = function()
			require("plugins.tokyonight")
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require("lualine").setup({options = {theme="tokyonight"} })
		end
	}
	-- Nvim Tree
	-- use {
	--   'nvim-tree/nvim-tree.lua',
	--   requires = {
	--     'nvim-tree/nvim-web-devicons', -- optional, for file icons
	--   },
	--   tag = 'nightly' -- optional, updated every week. (see issue #1193)
	-- }
	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
		-- requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Telescope file browser
	use { 
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("plugins.telescope-fb")
		end
	}
	use('nvim-lua/plenary.nvim')
	use('nvim-lua/popup.nvim')
	-- NVIM COMMENT
	use{
		"terrortylor/nvim-comment",
		config  = function()
			require("nvim_comment").setup({
                           
			})
		end 
	}
	-- BarBar
	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
	use {
	    'kosayoda/nvim-lightbulb',
	    requires = 'antoinemadec/FixCursorHold.nvim',
		config = function ()
			require('nvim-lightbulb').setup({
				autocmd = {enabled = true,events = {"CursorHold","CursorHoldI"}}
			})
		end 
	}
	-- Autoclose
	use{
		'm4xshen/autoclose.nvim',
		config = function()
			require("autoclose").setup({})
		end
	}
	-- Hover
	use {
	    "lewis6991/hover.nvim",
	    config = function()
		require("hover").setup {
		    init = function()
			-- Require providers
			require("hover.providers.lsp")
			-- require('hover.providers.gh')
			-- require('hover.providers.gh_user')
			-- require('hover.providers.jira')
			-- require('hover.providers.man')
			-- require('hover.providers.dictionary')
		    end,
		    preview_opts = {
			border = nil
		    },
		    -- Whether the contents of a currently open hover window should be moved
		    -- to a :h preview-window when pressing the hover keymap.
		    preview_window = false,
		    title = true
		}

		-- Setup keymaps
		vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
		vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
	    end
	}



	if packer_bootstrap then
	    require('packer').sync()
	end
end)
