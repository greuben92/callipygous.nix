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

vim.g.mapleader = ","
vim.g.netrw_banner = 0
vim.g.netrw_alt = 1
vim.g.netrw_winsize = 20
vim.g.netrw_browse_split = 0

vim.o.smartindent = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.number = true
vim.o.report = 0
vim.o.laststatus = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.listchars = "tab:| ,trail:-,nbsp:+"
vim.o.completeopt = "menuone,noselect"
vim.o.wildmode = "list:longest"
vim.o.signcolumn = "yes"
vim.o.breakindent = true
vim.o.termguicolors = true
vim.opt.shortmess:append("c")
vim.o.scrolloff = 8
vim.o.sidescrolloff = 15
vim.o.sidescroll = 1

vim.keymap.set("n", "//", ":nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "]q", ":cnext<cr>")
vim.keymap.set("n", "[q", ":cprev<cr>")
vim.keymap.set("n", "]l", ":lnext<cr>")
vim.keymap.set("n", "[l", ":lprev<cr>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("c", "<c-n>", "<down>")
vim.keymap.set("c", "<c-p>", "<up>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

require("lazy").setup("reuben/plugins")

vim.cmd [[
  set background=dark
  colorscheme catppuccin
]]
