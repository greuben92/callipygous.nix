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
    -- autostart = false,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = on_attach
  }, opts or {}))
end

-- setup(lspconfig.lua_ls)

setup(lspconfig.tsserver)

setup(lspconfig.svelte)

local prettier = {
  formatCanRange = true,
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
  rootMarkers = { ".prettierrc" },
};
lspconfig.efm.setup({
  on_attach = on_attach,
  settings = {
    languages = {
      typescript = { prettier },
      javascript = { prettier },
      svelte = { prettier },
      json = { prettier },
      html = { prettier },
      css = { prettier },
      php = {
        {
          prefix = "phpcs",
          lintSource = "efm/phpcs",
          lintCommand = "./vendor/bin/phpcs --no-colors --report=emacs",
          lintStdin = true,
          lintFormats = { "%.%#:%l:%c: %trror - %m", "%.%#:%l:%c: %tarning - %m" },
          rootMarkers = { ".phpcs.xml", "phpcs.xml", ".phpcs.xml.dist", "phpcs.xml.dist", "composer.json" },
        },
      },
    },
  },
  filetypes = { "typescript", "svelte", "javascript", "json", "html", "css", "php" },
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

-- setup(lspconfig.phpactor)

setup(lspconfig.elixirls, {
  cmd = { "elixir-ls" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = true,
    },
  },
})

-- setup(lspconfig.rust_analyzer, {
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--         enable = true,
--         command = "clippy",
--       },
--     }
--   }
-- })
