-- <leader>: space
vim.g.mapleader = " "

-- file view (idk why I did p, but now it's muscle mem)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- file search
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move lines, then zz to center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move lines, then zz to center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete without yanking
vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- append to word under cursor
-- s "string"
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

-- format json with jq
-- f "format" j "json"
vim.keymap.set("n", "<leader>fj", ":%!jq .<CR>")

-- global 'F'ind and 'R'eplace
-- requires confirmation for each
vim.keymap.set("n", "<leader>FR", ":%s/\\<<C-r><C-w>\\>//gcI<left><left><left><left>")

-- allow :W to write similarly to :w
vim.keymap.set("c", "W", "w")

-- keymap to surround highlighted text with whitespace and curly braces
-- then move cursor to word and maintain highlighted text
-- exampleWord -> { exampleWord }
-- scb "space curly brace"
vim.keymap.set("v", "<leader>scb", "c{<C-r>\"}<Esc>bi<Space><Esc>ea<Space><Esc>")
-- now just surround with curly braces
vim.keymap.set("v", "<leader>cb", "c{<C-r>\"}<Esc>")

-- keymap to surround highlighted text with double quotes
-- exampleWord -> "exampleWord"
vim.keymap.set("v", "<leader>dq", "c\"<C-r>\"<Esc>")
