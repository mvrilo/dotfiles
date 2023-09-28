-- Boostrap Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init({ autoremove = true })
packer.startup(function()
	use 'lewis6991/impatient.nvim'
	use 'wbthomason/packer.nvim'

	use {
		'williamboman/nvim-lsp-installer',
		requires = {
			'neovim/nvim-lspconfig',
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			-- require("luasnip.loaders.from_vscode").load()
		end,
	}

  use {
	  'ms-jpq/coq_nvim', branch = 'coq',
  }
  use {
	  'ms-jpq/coq.artifacts', branch = 'artifacts',
  }
  use {
	  'ms-jpq/coq.thirdparty', branch = '3p',
  }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' },
	}

  use 'simrat39/rust-tools.nvim'

	use {
		'tpope/vim-dispatch',
		opt = true,
		cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
	}

	use {
		'w0rp/ale',
		-- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}
	-- use {
	-- 'w0rp/ale',
	-- 	config = function() require('ale').setup() end
	-- }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		ensure_installed = { "go", "javascript", "typescript", "shell", "lua", "rust", "zig" }
	}

	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	use 'voldikss/vim-floaterm'
	use 'leafgarland/typescript-vim'
	use 'peitalin/vim-jsx-typescript'

	use {
		'mattn/gist-vim',
		cmd = {'Gist'},
		config = function() require('gist-vim').setup() end
	}
	use 'tpope/vim-eunuch'
	use 'tpope/vim-endwise'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'hashivim/vim-terraform'
	use {
		'junegunn/vim-easy-align',
		cmd = {'EasyAlign'}
	}
	use 'junegunn/gv.vim'
	use 'haya14busa/incsearch.vim'
	use 'rust-lang/rust.vim'
	use 'andymass/vim-matchup'
	use 'airblade/vim-gitgutter'
	use 'itchyny/lightline.vim'
	use 'sbdchd/neoformat'
	use {
		'fatih/vim-go',
		run = ':GoUpdateBinaries'
	}
	use 'buoto/gotests-vim'
	use 'racer-rust/vim-racer'
	use 'jbyuki/venn.nvim'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use 'joshdick/onedark.vim'
	use {
		'folke/tokyonight.nvim',
		theme = 'tokyonight'
	}
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      require("nvim-tree").setup()
    end
  }

  use 'mfussenegger/nvim-dap'

  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"}
  }

  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        welcome_message = " hey ",
        chat_input = {
          prompt = " >  ",
        }
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)

if bootstrap then
	packer.sync()
end
