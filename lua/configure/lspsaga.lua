local plugin = {}

plugin.core = {
    --"glepnir/lspsaga.nvim",
    --"rinx/lspsaga.nvim",
    "tami5/lspsaga.nvim",
    --as = "lspsaga",

    setup = function()  -- Specifies code to run before this plugin is loaded.

    end,

    config = function() -- Specifies code to run after this plugin is loaded
        local lspsaga = require('lspsaga')
        lspsaga.setup { -- defaults ...
            debug = false,
            use_saga_diagnostic_sign = true,
            -- diagnostic sign
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = "",
            diagnostic_header_icon = "   ",
            -- code action title icon
            code_action_icon = " ",
            code_action_prompt = {
                enable = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
            },
            finder_definition_icon = "  ",
            finder_reference_icon = "  ",
            max_preview_lines = 10,
            finder_action_keys = {
                open = "o",
                vsplit = "s",
                split = "i",
                quit = "q",
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            code_action_keys = {
                quit = "q",
                exec = "<CR>",
            },
            rename_action_keys = {
                quit = "<C-c>",
                exec = "<CR>",
            },
            definition_preview_icon = "  ",
            border_style = "single",
            rename_prompt_prefix = "➤",
            rename_output_qflist = {
                enable = false,
                auto_open_qflist = false,
            },
            server_filetype_map = {},
            diagnostic_prefix_format = "%d. ",
            diagnostic_message_format = "%m %c",
            highlight_prefix = false,
        }

        vim.cmd('augroup ' .. "lspsaga_filetype")
        vim.cmd 'autocmd!'
        vim.cmd('autocmd FileType LspsagaCodeAction nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaDiagnostic nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaFinder nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaFloaterm nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaRename nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd('autocmd FileType LspsagaSignatureHelp nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>')
        vim.cmd 'augroup END'
    end,
}

plugin.mapping = function()
    local mappings = require('core.mapping')
    mappings.register({
        mode = "n",
        key = {"g", "r"},
        action = '<cmd>Lspsaga rename<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        --key = {"g", "x"},
        key = {"<A-enter>"},
        action = '<cmd>Lspsaga code_action<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "x",
        key = {"g", "x"},
        action = ':<c-u>Lspsaga range_code_action<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"K"},
        action = '<cmd>Lspsaga hover_doc<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"g", "o"},
        action = '<cmd>Lspsaga show_line_diagnostics<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"g", "j"},
        action = '<cmd>Lspsaga diagnostic_jump_next<cr>',
        short_desc = "goto definition",
        silent = false
    })
    mappings.register({
        mode = "n",
        key = {"g", "k"},
        action = '<cmd>Lspsaga diagnostic_jump_prev<cr>',
        short_desc = "goto definition",
        silent = false
    })
    --mappings.register({
        --mode = "n",
        --key = {"<C-u>"},
        --action = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
        --short_desc = "goto definition",
        --silent = false
    --})
    --mappings.register({
        --mode = "n",
        --key = {"<C-k>"},
        --action = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
        --short_desc = "goto definition",
        --silent = false
    --})

end
return plugin
