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

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  }
  use 'nvim-lua/plenary.nvim'
  use 'airblade/vim-gitgutter'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1'
  }
  use 'nanotech/jellybeans.vim'
  use 'chr4/nginx.vim'
  use 'ntpeters/vim-better-whitespace'
  use 'tpope/vim-fugitive'
  use 'rust-lang/rust.vim'
  use 'fatih/vim-go'
  use 'rhysd/vim-llvm'
  use 'hashivim/vim-terraform'
  use 'jparise/vim-graphql'
  use 'HerringtonDarkholme/yats.vim'
  use 'jxnblk/vim-mdx-js'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
