-- floaterm
vim.g.floaterm_width = 90
vim.g.floaterm_height = 30
vim.keymap.set("n", "<C-t>t", ":FloatermToggle<CR>")
vim.keymap.set("t", "<C-t>t", "<C-\\><C-n>:FloatermToggle<CR>")

-- filetree
vim.keymap.set("n", "<leader>ft", ":Lexplore | vert res 40<CR>")
vim.keymap.set("n", "<leader>nt", ":Lexplore<CR>")

vim.g.netrw_winsize = -40
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_localrmdir = 'rm -r'

-- copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>")
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
}

-- barbar
vim.keymap.set("n", "<leader>bn", ":BufferNext<CR>")
vim.keymap.set("n", "<leader>bb", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>")
vim.keymap.set("n", "<leader>br", ":BufferRestore<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferPick<CR>")

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
-- sscb "surround space curly brace"
vim.keymap.set("v", "<leader>sscb", "c{<C-r>\"}<Esc>bi<Space><Esc>ea<Space><Esc>")
-- now just surround with curly braces
-- exampleWord -> {exampleWord}
-- scb "surround curly brace"
vim.keymap.set("v", "<leader>scb", "c{<C-r>\"}<Esc>")

-- keymap to surround highlighted text with double quotes
-- exampleWord -> "exampleWord"
-- sdq "surround double quotes"
vim.keymap.set("v", "<leader>sdq", [[<Esc>`<i"<Esc>`>la"<Esc>]], { noremap = true, silent = true })

-- keymap to surround highlighted text with parentheses
-- exampleWord -> (exampleWord)
-- sp "surround parentheses"
vim.keymap.set("v", "<leader>sp", [[<Esc>`<i(<Esc>`>la)<Esc>]], { noremap = true, silent = true })

-- keymap to surround highlighted text with square brackets
-- exampleWord -> [exampleWord]
-- ssb "surround square brackets"
vim.keymap.set("v", "<leader>ssb", [[<Esc>`<i[<Esc>`>la]<Esc>]], { noremap = true, silent = true })

-- keymap to surround highlighted text with mustache brackets
-- exampleWord -> {exampleWord}
-- sm "surround mustaches"
vim.keymap.set("v", "<leader>sm", [[<Esc>`<i{<Esc>`>la}<Esc>]], { noremap = true, silent = true })


-- keymap for swapping the view of vertical split windows
-- [s]wap [v]ertical [s]plit
vim.keymap.set("n", "<leader>svs", "<C-w>h<C-w>K<C-w>L")

-- keymap to go to definition of word under cursor in a vertical split
-- [v]ertical [s]plit [g]o [d]efinition
vim.keymap.set("n", "<leader>vsgd", "<C-w>v<C-w>l<C-]>")

-- diagnostics info
-- open float window with diagnostics for current line
-- [d]iagnostics [i]nfo
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float)
