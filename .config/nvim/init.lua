vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 2
vim.g.netrw_list_hide = [[^\(ntuser\|NTUSER\)\..*]]
vim.g.netrw_winsize = -20

-- key map to emulate <c-[> in vim terminal
vim.api.nvim_set_keymap("t", "<c-[>", [[<c-\><c-n><esc>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<esc>", "<esc>", { noremap = true })

-- functions
TermBoot = function()
    vim.cmd [[silent! terminal pwsh]]
    vim.cmd [[silent! startinsert]]
end

-- define vim command
vim.cmd [[command! TermBoot lua TermBoot()]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
