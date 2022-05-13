local plugin = {}

plugin.core = {
    "neovim/nvim-lspconfig",
    --as = "nvim-lspconfig",
    setup = function()  -- Specifies code to run before this plugin is loaded.

    end,

    config = function() -- Specifies code to run after this plugin is loaded

    end,
}

plugin.mapping = function()
    local mappings = require('core.mapping')
    mappings.register({
        mode = "n",
        key = {"g", "d"},
        action = '<cmd>lua vim.lsp.buf.definition()<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"g", "D"},
        action = '<cmd>lua vim.lsp.buf.declaration()<cr>',
        short_desc = "goto declaration",
        silent = false
    })
    --mappings.register({
        --mode = "n",
        --key = {"g", "r"},
        --action = '<cmd>lua vim.lsp.buf.references()<cr>',
        --short_desc = "goto references",
        --silent = false
    --})
    mappings.register({
        mode = "n",
        key = {"g", "i"},
        action = '<cmd>lua vim.lsp.buf.implementation()<cr>',
        short_desc = "goto implementation",
        silent = false
    })

    --mappings.register({
        --mode = "n",
        --key = {"K"},
        --action = '<cmd>lua vim.lsp.buf.hover()<cr>',
        --short_desc = "Displays hover information about the symbol.",
        --desc = "Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.",
        --silent = false
    --})
    mappings.register({
        mode = "n",
        key = {"<C-n>"},
        action = '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
        short_desc = "goto prev",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"<C-p>"},
        action = '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
        short_desc = "goto next",
        silent = false
    })

end
return plugin
