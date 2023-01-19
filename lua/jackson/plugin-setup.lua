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

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then
    return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'            -- Plugin Manager

    use 'ntk148v/vim-horizon'               -- Theme

    use {                                   -- File Explorer
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        tag = 'nightly'
    }

    use 'jiangmiao/auto-pairs'              -- Autocompletes (), [], {}

    use {                                   -- Statusline
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    use {                                   -- Fuzzy Finder
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use 'hrsh7th/nvim-cmp'                  -- Completion
    use 'hrsh7th/cmp-buffer'                -- Source for buffers
    use 'hrsh7th/cmp-path'                  -- Source for file system paths
    use 'L3MON4D3/LuaSnip'                  -- Snippet enginge
    use 'saadparwaiz1/cmp_luasnip'          -- Autocomplete snippets
    use 'rafamadriz/friendly-snippets'      -- Useful snippets

    use 'williamboman/mason.nvim'           -- Manager for lsp servers, linters, and formatters
    use 'williamboman/mason-lspconfig.nvim' -- Bridges gap between mason & lspconfig

    use 'neovim/nvim-lspconfig'             -- Easily configure language servers
    use 'hrsh7th/cmp-nvim-lsp'              -- For autocompletion
    use 'onsails/lspkind.nvim'              -- VS-Code like icons for autocompletion

    if packer_bootstrap then
        require('packer').sync()
    end
end)
