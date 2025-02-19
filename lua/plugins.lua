local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = ':MasonUpdate'
      },
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  };

  {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  };

  'nvim-lua/plenary.nvim';
  'airblade/vim-gitgutter';
  'nvim-lualine/lualine.nvim';

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4'
  };

  'nanotech/jellybeans.vim';
  'chr4/nginx.vim';
  'ntpeters/vim-better-whitespace';
  'tpope/vim-fugitive';
  'rust-lang/rust.vim';
  'fatih/vim-go';
  'rhysd/vim-llvm';
  'hashivim/vim-terraform';
  'jparise/vim-graphql';
  'HerringtonDarkholme/yats.vim';
  'jxnblk/vim-mdx-js';
}
