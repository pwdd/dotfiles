return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'rafamadriz/neon'

  use({
  	"catppuccin/nvim",
  	as = "catppuccin",
  	config = require('noite.plugins.catppuccin').setup()
  })

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      }
  }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true, theme = 'neon' },
    config = require('noite.plugins.lualine').setup()
  }

  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
    config = require('noite.plugins.cmp').setup(),
  })

  use 'kevinhwang91/nvim-bqf'

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = require('noite.plugins.indent_blankline').setup()
  })

  use 'machakann/vim-sandwich'
  use 'neovim/nvim-lspconfig'

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
    config = require('noite.plugins.telescope').setup(),
  })

  use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require('noite.plugins.treesitter').setup()
  })

  use 'nvim-treesitter/playground'

  use({
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    }
  })

  use({'ckipp01/nvim-jenkinsfile-linter', requires = { 'nvim-lua/plenary.nvim' } })

  use 'sheerun/vim-polyglot'
  use 'tpope/vim-fugitive'
  use 'christoomey/vim-tmux-navigator'
  use 'Raimondi/delimitMate'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
  use 'ekalinin/Dockerfile.vim'
  use 'Chiel92/vim-autoformat'
  use 'roxma/nvim-yarp'
  use 'roxma/vim-hug-neovim-rpc'

--   use {
--     "folke/which-key.nvim",
--     config = require("noite.plugins.whichkey").setup()
--   }
end)
