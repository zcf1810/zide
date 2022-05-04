-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zcf1810/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zcf1810/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zcf1810/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zcf1810/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zcf1810/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["gruvbox-material"] = {
    config = { "\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zcf1810/.local/share/nvim/site/pack/packer/opt/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  impatient = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/zcf1810/.local/share/nvim/site/pack/packer/opt/impatient",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-tree"] = {
    config = { "\27LJ\2\2�\t\0\0\5\0+\0K6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\16\0=\1\14\0006\0\0\0009\0\1\0005\1\18\0005\2\19\0=\2\20\1=\1\17\0006\0\0\0009\0\21\0'\1\22\0B\0\2\0016\0\23\0'\1\24\0B\0\2\0029\0\25\0005\1\26\0005\2\27\0005\3\28\0004\4\0\0=\4\29\3=\3\30\2=\2\31\0015\2 \0005\3!\0=\3\"\0024\3\0\0=\3#\2=\2$\0015\2%\0=\2&\0015\2'\0005\3(\0=\3)\2=\2*\1B\0\2\1K\0\1\0\16diagnostics\nicons\1\0\4\tinfo\t \thint\t \nerror\t \fwarning\t \1\0\1\venable\1\bgit\1\0\2\vignore\1\venable\1\ffilters\fexclude\vcustom\1\3\0\0\19$XDG_DATA_HOME\16__pycache__\1\0\1\rdotfiles\1\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\3\15signcolumn\byes\tside\tleft\nwidth\b20%\1\0\4\15update_cwd\2\18disable_netrw\2\18open_on_setup\1\17hijack_netrw\2\nsetup\14nvim-tree\frequire/highlight NvimTreeFolderIcon guifg=#0077aa\bcmd\vfolder\1\0\b\topen\b\15empty_open\b\fdefault\b\15arrow_open\b\nempty\b\fsymlink\b\17arrow_closed\b\17symlink_open\b\1\0\3\fdefault\b\fsymlink\b\nhjson\6!\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\0\1\0\4\ffolders\3\1\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\25nvim_tree_show_icons\1\0\2\rMAKEFILE\3\1\rMakefile\3\1\28nvim_tree_special_files\6 \27nvim_tree_icon_padding\26nvim_tree_group_empty\27nvim_tree_add_trailing\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\6g\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/zcf1810/.local/share/nvim/site/pack/packer/opt/nvim-tree",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: gruvbox-material
time([[Setup for gruvbox-material]], true)
try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "setup", "gruvbox-material")
time([[Setup for gruvbox-material]], false)
-- Setup for: nvim-tree
time([[Setup for nvim-tree]], true)
try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "setup", "nvim-tree")
time([[Setup for nvim-tree]], false)
time([[packadd for nvim-tree]], true)
vim.cmd [[packadd nvim-tree]]
time([[packadd for nvim-tree]], false)
-- Setup for: impatient
time([[Setup for impatient]], true)
try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "setup", "impatient")
time([[Setup for impatient]], false)
time([[packadd for impatient]], true)
vim.cmd [[packadd impatient]]
time([[packadd for impatient]], false)
-- Config for: nvim-tree
time([[Config for nvim-tree]], true)
try_loadstring("\27LJ\2\2�\t\0\0\5\0+\0K6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\16\0=\1\14\0006\0\0\0009\0\1\0005\1\18\0005\2\19\0=\2\20\1=\1\17\0006\0\0\0009\0\21\0'\1\22\0B\0\2\0016\0\23\0'\1\24\0B\0\2\0029\0\25\0005\1\26\0005\2\27\0005\3\28\0004\4\0\0=\4\29\3=\3\30\2=\2\31\0015\2 \0005\3!\0=\3\"\0024\3\0\0=\3#\2=\2$\0015\2%\0=\2&\0015\2'\0005\3(\0=\3)\2=\2*\1B\0\2\1K\0\1\0\16diagnostics\nicons\1\0\4\tinfo\t \thint\t \nerror\t \fwarning\t \1\0\1\venable\1\bgit\1\0\2\vignore\1\venable\1\ffilters\fexclude\vcustom\1\3\0\0\19$XDG_DATA_HOME\16__pycache__\1\0\1\rdotfiles\1\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\3\15signcolumn\byes\tside\tleft\nwidth\b20%\1\0\4\15update_cwd\2\18disable_netrw\2\18open_on_setup\1\17hijack_netrw\2\nsetup\14nvim-tree\frequire/highlight NvimTreeFolderIcon guifg=#0077aa\bcmd\vfolder\1\0\b\topen\b\15empty_open\b\fdefault\b\15arrow_open\b\nempty\b\fsymlink\b\17arrow_closed\b\17symlink_open\b\1\0\3\fdefault\b\fsymlink\b\nhjson\6!\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\0\1\0\4\ffolders\3\1\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\25nvim_tree_show_icons\1\0\2\rMAKEFILE\3\1\rMakefile\3\1\28nvim_tree_special_files\6 \27nvim_tree_icon_padding\26nvim_tree_group_empty\27nvim_tree_add_trailing\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\6g\bvim\0", "config", "nvim-tree")
time([[Config for nvim-tree]], false)
-- Config for: impatient
time([[Config for impatient]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient")
time([[Config for impatient]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
