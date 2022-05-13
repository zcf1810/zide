local plugin = {}

plugin.core = {
    "williamboman/nvim-lsp-installer",
    --as = "nvim-lspinstaller",
    requires = {
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
    },

    setup = function() -- Specifies code to run before this plugin is loaded.

    end,

    config = function() -- Specifies code to run after this plugin is loaded
        -- https://github.com/williamboman/nvim-lsp-installer
        local lsp_installer_servers = require("nvim-lsp-installer.servers")
        -- 名称：https://github.com/williamboman/nvim-lsp-installer#available-lsps
        -- 配置：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        --
        -- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验

        local servers = {
            -- 语言服务器名称：配置选项
            sumneko_lua = require("configure.sumneko_lua"),
            pyright = require("configure.pyright"),
            rust_analyzer = {},
            clangd = {},
            jdtls = {},
            -- tsserver = require("lsp.tsserver"),
            -- html = require("lsp.html"),
            -- cssls = require("lsp.cssls"),
            -- gopls = require("lsp.gopls"),
            -- jsonls = require("lsp.jsonls"),
            -- zeta_note = require("lsp.zeta_note"),
            -- sqls = require("lsp.sqls"),
            -- vuels = require("lsp.vuels")
        }
        -- 这里是 LSP 服务启动后的按键加载, 可以移动到每个lsp的的配置中
        local function attach(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            -- enable completion trippered by <c-x><c-o>
            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

            ---- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
            --vim.keybinds.bmap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", vim.keybinds.opts)
            ---- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
            --vim.keybinds.bmap(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", vim.keybinds.opts)
            ---- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
            --vim.keybinds.bmap(bufnr, "n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", vim.keybinds.opts)
            ---- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
            --vim.keybinds.bmap(bufnr, "n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", vim.keybinds.opts)
            ---- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
            --vim.keybinds.bmap(bufnr, "n", "<leader>cn", "<cmd>Lspsaga rename<CR>", vim.keybinds.opts)
            ---- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
            --vim.keybinds.bmap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", vim.keybinds.opts)
            ---- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
            --vim.keybinds.bmap(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", vim.keybinds.opts)
            ---- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
            --vim.keybinds.bmap(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", vim.keybinds.opts)
            ---- 悬浮窗口上翻页，由 Lspsaga 提供
            --vim.keybinds.bmap(
            --bufnr,
            --"n",
            --"<C-p>",
            --"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
            --vim.keybinds.opts
            --)
            ---- 悬浮窗口下翻页，由 Lspsaga 提供
            --vim.keybinds.bmap(
            --bufnr,
            --"n",
            --"<C-n>",
            --"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
            --vim.keybinds.opts
            --)
            --
        end

        -- 自动安装或启动 LanguageServers
        local lsp_config = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        for server_name, server_options in pairs(servers) do
            local server_available, server = lsp_installer_servers.get_server(server_name)
            -- 判断服务是否可用
            if server_available then
                if not server:is_installed() then
                    vim.notify("Install Language Server : " .. server_name, "WARN", { title = "Language Servers" })
                    server:install()
                end
                server_options.attach = attach;
                server_options.capabilities = capabilities
                lsp_config[server_name].setup(server_options)
            end
        end
        ---- auto format when write file
        --vim.cmd('augroup ' .. "lsp_format")
        --vim.cmd 'autocmd!'
        --vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format()')
        --vim.cmd 'augroup END'
    end,
}

plugin.mapping = function()

end

return plugin
