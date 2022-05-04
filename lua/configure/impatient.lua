local plugin = {}

plugin.core = {
    'lewis6991/impatient.nvim',
    as = "impatient",
    setup = function()  -- Specifies code to run before this plugin is loaded.

    end,

    config = function() -- Specifies code to run after this plugin is loaded
        require("impatient").enable_profile()
    end
}

plugin.mapping = function()

end
return plugin
