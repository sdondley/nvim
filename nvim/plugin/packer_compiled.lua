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
local package_path_str = "/Users/stevedondley/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/stevedondley/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/stevedondley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/stevedondley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/stevedondley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  fzf = {
    commands = { "fzf#install()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/opt/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["perlomni.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/opt/perlomni.vim",
    url = "https://github.com/c9s/perlomni.vim"
  },
  ["phpfolding.vim"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/phpfolding.vim",
    url = "https://github.com/rayburgemeestre/phpfolding.vim"
  },
  ["stylua-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/opt/stylua-nvim",
    url = "https://github.com/ckipp01/stylua-nvim"
  },
  taskwiki = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/opt/taskwiki",
    url = "https://github.com/tools-life/taskwiki"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-tmuxify"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/vim-tmuxify",
    url = "https://github.com/jebaum/vim-tmuxify"
  },
  ["vim-you-autocorrect"] = {
    loaded = true,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/start/vim-you-autocorrect",
    url = "https://github.com/sedm0784/vim-you-autocorrect"
  },
  vimwiki = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/stevedondley/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[au CmdUndefined fzf#install() ++once lua require"packer.load"({'fzf'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'taskwiki', 'vimwiki'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType perl ++once lua require("packer.load")({'perlomni.vim'}, { ft = "perl" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'stylua-nvim'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
