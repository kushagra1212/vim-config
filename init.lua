-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("autocmd BufRead,BufNewFile *.fg set filetype=fg")
vim.api.nvim_set_keymap("v", "<C-/>", ":norm I//<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<U-/>", ":s!^//!!<CR>", { noremap = true, silent = true })
-- Delete without yanking
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
-- Paste most recent yank without affecting register

vim.api.nvim_set_keymap("n", "p", ':let @"=@-2<CR>"0p', { noremap = true, silent = true })

-- Switch to previous buffer when closing the current buffer
vim.api.nvim_set_keymap("n", "<C-x>", ":bp<bar>bd #<CR>", { noremap = true, silent = true })
-- Set the file encoding to UTF-8 for all C++ files
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = "utf-8"
require("lspconfig").clangd.setup({
  capabilities = capabilities,
})

vim.api.nvim_set_keymap("i", "<C-q>", 'copilot#Accept("<CR>")', { silent = true, noremap = true, expr = true })
vim.g.copilot_no_tab_map = true
