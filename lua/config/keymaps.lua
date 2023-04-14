-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- vim.keymap.set("n", "<leader>sx", require("telescope.builtin").resume, {
--   noremap = true,
--   silent = true,
--   desc = "Resume",
-- })
--
-- -- Compile and run C++ code
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
vim.cmd([[
augroup filetypes
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <C-c> :w <bar> !gnome-terminal --window -- bash -c "node %; read -p 'Press enter to close this window...'"<CR>
autocmd FileType cpp nnoremap <buffer> <leader>c :w <bar> !xterm -ls -xrm 'XTerm*selectToClipboard: true'  -fa "Monospace" -fs 16 -fullscreen -hold -e "g++ -std=gnu++17 -O2 '%' -o '%:p:h/%:t:r' && '%:p:h/%:t:r' && read -p '[Press enter to close this window...]'"<CR>
autocmd FileType java nnoremap <buffer> <C-c> :w <bar> !gnome-terminal --window -- bash -c "javac % && java %:p:t; read -p 'Press enter to close this window...'"<CR>
  autocmd FileType python nnoremap <buffer> <C-c> :w <bar> !gnome-terminal --window -- bash -c "python3 %; read -p 'Press enter to close this window...'"<CR> 
  autocmd FileType perl nnoremap <buffer> <C-c> :w <bar> !perl % <CR> 
  autocmd FileType go nnoremap <buffer> <C-c> :w <bar> !go build % && ./%:p <CR>
augroup END
]])
-- Save and compile C++ code
map(
  "n",
  "<leader>s",
  "<cmd>w<cr><cmd>!g++ % -o %< && echo 'Compilation successful' || echo 'Compilation failed' <cr>",
  { desc = "Save and compile C++ code" }
)

-- Open terminal
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open terminal" })
