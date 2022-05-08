-- refer to: https://bytemeta.vip/repo/onsails/lspkind-nvim
local plugin = {}

plugin.core = {
    "onsails/lspkind-nvim",
    --as = "lspkind-nvim",
    setup = function()  -- Specifies code to run before this plugin is loaded.

    end,

    config = function() -- Specifies code to run after this plugin is loaded
        require('lspkind').init({
                -- enables text annotations
                --
                -- default: true
                -- fix bug: https://bytemeta.vip/repo/onsails/lspkind-nvim/issues/39https://bytemeta.vip/repo/onsails/lspkind-nvim/issues/39 
                -- with_text = true,
                mode = "symbol_text",
                -- default symbol map
                -- can be either 'default' or
                -- 'codicons' for codicon preset (requires vscode-codicons font installed)
                --
                -- default: 'default'
                preset = 'codicons',

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = '',
                    Method = '',
                    Function = '',
                    Constructor = '',
                    Variable = '',
                    Class = '',
                    Interface = 'ﰮ',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '',
                    Keyword = '',
                    Snippet = '﬌',
                    Color = '',
                    File = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = ''
                },
            })


    end,
}

plugin.mapping = function()

end
return plugin
