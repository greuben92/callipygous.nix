return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>t", builtin.find_files)
      vim.keymap.set("n", "<leader>b", builtin.buffers)
      vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
      vim.keymap.set("n", "<leader>g", builtin.live_grep)

      vim.keymap.set("n", "<leader>vrc", function()
        builtin.find_files({
          prompt_title = "< DOTFILES >",
          cwd = vim.env.HOME .. "/.dotfiles",
        })
      end)
    end
  },

  "tpope/vim-fugitive",
  "tpope/vim-sleuth", -- automatically set indentation based on file
  { "numToStr/Comment.nvim", opts = {} },
  "tpope/vim-repeat",
  "tpope/vim-surround",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Languages
  "ziglang/zig.vim",
  "fatih/vim-go",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("reuben/treesitter")
    end
  },

  -- Let there be VSCode
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "j-hui/fidget.nvim",
      opts = {
        progress = {
          ignore_empty_message = true,
          display = {
            render_limit = 4
          },
        },
      },
    },
    config = function()
      require("reuben/lsp")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      require("reuben/cmp")
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = function()
      require("lazydev").setup()
    end
  },
}
