local plugin = {}

plugin.core = {
    "hrsh7th/nvim-cmp",

    requires = {
        {"hrsh7th/cmp-buffer"}, -- buffer completions
        {"hrsh7th/cmp-path"}, -- path completions
        {"hrsh7th/cmp-cmdline"}, -- cmdline completions
        {"saadparwaiz1/cmp_luasnip"}, -- snippet completions
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-nvim-lua"},
        {"hrsh7th/cmp-calc"}, -- spell check
        {"f3fora/cmp-spell"}, -- spell check
        {'hrsh7th/cmp-vsnip'},
        {'hrsh7th/vim-vsnip'},
    },
    --as = "nvim-compe",
    setup = function()  -- Specifies code to run before this plugin is loaded.
    end,

    config = function() -- Specifies code to run after this plugin is loaded
        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            experimential = {
                native_menu = false,
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                    end
                end, { "i", "s" }),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' }, -- For vsnip users.
                { name = 'vsnip' }, -- For vsnip users.
                { name = 'path' }, -- For vsnip users.
                { name = 'spell' }, -- For vsnip users.
                { name = 'calc' }, -- For vsnip users.
            }, {
                    { name = 'buffer' },
                })
        })
        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                    { name = 'cmdline' }
                })
        })

        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        end

        -- Setup lspconfig.
        local nvim_lsp = require('lspconfig')

        -- setup languages 
        -- GoLang
        nvim_lsp['gopls'].setup{
            cmd = {'gopls'},
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
            init_options = {
                usePlaceholders = true,
            }
        }

    end
}

plugin.mapping = function()
    local mappings = require('core.mapping')
    local is_prior_char_whitespace = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    -- Use (shift-)tab to:
    -- move to prev/next item in completion menu
    -- jump to the prev/next snippet placeholder
    -- insert a simple tab
    -- start the completion menu
    _G.tab_completion = function()
        if vim.fn.pumvisible() == 1 then
            return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)

        elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)

        elseif is_prior_char_whitespace() then
            return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)

        else
            return vim.fn['compe#complete']()
        end
    end
    _G.shift_tab_completion = function()
        if vim.fn.pumvisible() == 1 then
            return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)

        elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#JumpBackwards()<CR>", true, true, true)

        else
            return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
        end
    end
    --mappings.register({
        --mode = "i",
        --key = {"<Tab>"},
        --action = 'v:lua.tab_complete()',
        --short_desc = "complete",
        --expr = true
    --})
    --mappings.register({
        --mode = "s",
        --key = {"<Tab>"},
        --action = 'v:lua.tab_complete()',
        --short_desc = "complete",
        --expr = true
    --})
    --mappings.register({
        --mode = "i",
        --key = {"<S-Tab>"},
        --action = 'v:lua.s_tab_complete()',
        --short_desc = "complete",
        --expr = true
    --})
    --mappings.register({
        --mode = "s",
        --key = {"<S-Tab>"},
        --action = 'v:lua.s_tab_complete()',
        --short_desc = "complete",
        --expr = true
    --})
end
return plugin
