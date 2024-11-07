-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  spec = {
    -- { 'dense-analysis/ale' },
    { 'airblade/vim-gitgutter' },

    {
      "ray-x/go.nvim",
      dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("go").setup()
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()'
    },

    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      'ggerganov/llama.cpp',
      config = function()
        vim.cmd('source ' .. vim.fn.stdpath('data') .. '/lazy/llama.cpp/examples/llama.vim')
        vim.cmd('call llama#init()')
      end
    },

    {
      "folke/noice.nvim",
      opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = function()
        require("noice").setup({
          -- lsp = {
          --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          --   override = {
          --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          --     ["vim.lsp.util.stylize_markdown"] = true,
          --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          --   },
          -- },
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        })
      end
    },

    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup()
      end,
    },

    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme tokyonight]])
      end,
    },

    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('lualine').setup({
          options = {
            theme = 'codedark',
          }
        })
      end
    },

    {
      "neovim/nvim-lspconfig",
      lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
      dependencies = {
        "ms-jpq/coq_nvim", branch = "coq",
        "ms-jpq/coq.artifacts", branch = "artifacts",
        'ms-jpq/coq.thirdparty', branch = "3p",
      },
      init = function()
        vim.g.coq_settings = {
          auto_start = 'shut-up',
        }
      end,
      config = function()
        local coq = require("coq")
        local nvim_lsp = require('lspconfig')
        local lservers = { "gopls", "tsserver", "bashls", "dockerls", "tflint" }

        for _, lsp in ipairs(lservers) do
          nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
          }))
        end
      end,
    },

    {
      'mrcjkb/rustaceanvim',
      version = '^5',
      lazy = false,
      config = function()
        vim.g.rustaceanvim = {
          -- Plugin configuration
          tools = {},
          -- LSP configuration
          server = {
            on_attach = function(client, bufnr)
              -- you can also put keymaps in here
            end,
            default_settings = {
              -- rust-analyzer language server configuration
              ['rust-analyzer'] = {},
            },
          },
          -- DAP configuration
          dap = {},
        }
      end
    }
  },
})
