return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate'
      },
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    }
  },

  {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  },

  'nvim-lua/plenary.nvim',
  'airblade/vim-gitgutter',
  'nvim-lualine/lualine.nvim',

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'nanotech/jellybeans.vim',
  'chr4/nginx.vim',
  'ntpeters/vim-better-whitespace',
  'tpope/vim-fugitive',
  'rust-lang/rust.vim',
  'fatih/vim-go',
  'rhysd/vim-llvm',
  'hashivim/vim-terraform',
  'jparise/vim-graphql',
  'HerringtonDarkholme/yats.vim',
  'jxnblk/vim-mdx-js',
  'github/copilot.vim',
}
