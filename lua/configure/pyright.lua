
local util = require("lspconfig.util")
return {
    root_dir = function(fname)
        return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", 
            "requirements.txt")(fname) or util.path.dirname(fname)
    end,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    --root_dir = function(filename)
    --return util.root_pattern(unpack(root_files))(filename) or util.path.dirname(filename)
    --end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}
