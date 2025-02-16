local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')


-- Start the LSP client for GDScript
lspconfig.gdscript.setup({
    cmd = { 'godot', '--lsp' },                                      -- Command to start the GDScript LSP server
    root_dir = lspconfig.util.root_pattern('project.godot', '.git'), -- Find the project root
    on_attach = function(client, bufnr)
        -- Optional: Add keybindings or other setup here
        print("GDScript LSP attached!")
    end,
})

-- Check if the GDScript LSP config is already defined
if not configs.gdscript then
    configs.gdscript = {
        default_config = {
            cmd = { 'godot', '--lsp' },                                      -- Command to start the GDScript LSP server
            filetypes = { 'gdscript' },                                      -- File types associated with this LSP
            root_dir = lspconfig.util.root_pattern('project.godot', '.git'), -- Root directory for the LSP
            settings = {},                                                   -- Optional settings
        },
    }
end

-- Start the LSP client for GDScript
lspconfig.gdscript.setup({})
