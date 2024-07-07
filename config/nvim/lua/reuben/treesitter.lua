require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua" },
  sync_install = true,
  auto_install = true,
  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = true },
})
