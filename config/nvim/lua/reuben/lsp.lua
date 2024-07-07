local lspconfig = require("lspconfig")
vim.lsp.set_log_level("off")

local on_attach = function(c, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr };
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, bufopts)
end

local setup = function(server, opts)
  server.setup(vim.tbl_deep_extend("force", {
    autostart = false,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = on_attach
  }, opts or {}))
end

setup(lspconfig.lua_ls)

setup(lspconfig.tsserver, {
  cmd = { "./node_modules/.bin/typescript-language-server", "--stdio" },
})

setup(lspconfig.svelte, {
  cmd = { "./node_modules/.bin/svelteserver", "--stdio" },
})

local prettier = {
  formatCanRange = true,
  formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
  rootMarkers = { ".prettierrc" },
};
lspconfig.efm.setup({
  settings = {
    languages = {
      typescript = { prettier },
      javascript = { prettier },
      svelte = { prettier },
      json = { prettier },
      html = { prettier },
      css = { prettier },
    },
  },
  filetypes = { "typescript", "svelte", "javascript", "json", "html", "css" },
  single_file_support = false,
  init_options = {
    documentFormatting = true,
  },
})

setup(lspconfig.gopls, {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

setup(lspconfig.hls, {
  settings = {
    haskell = {
      hlintOn = true,
      formattingProvider = "fourmolu",
    },
  },
})

setup(lspconfig.ocamllsp)
