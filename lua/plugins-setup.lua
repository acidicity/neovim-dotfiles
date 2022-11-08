local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    
    -- package manager
    use("wbthomason/packer.nvim")

    -- preferred colorscheme
    use("morhetz/gruvbox")

    -- helps with commenting stuff in code
    use("numToStr/Comment.nvim") 

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- icons
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- telescope fuzzy finding
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})  
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing & installing lsp servers
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
