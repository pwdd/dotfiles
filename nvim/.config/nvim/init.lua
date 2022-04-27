local opt = vim.opt
local api = vim.api
local cmd = vim.cmd
local g = vim.g
local f = require("noite.functions")

require("noite.plugins")
require('lualine').setup()
require('nvim-web-devicons').get_icons()
require('nvim-tree').setup()
require('which-key').setup()
require("noite.lsp").setup()
require("noite.diagnostic").setup()

vim.cmd[[colorscheme catppuccin]]
--cmd[[colorscheme neon]]

g.neon_style = "dark"
g.neon_italic_comment = true

opt.encoding = 'UTF-8'
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.textwidth = 120
opt.colorcolumn = '120'
opt.number = true
opt.foldmethod = 'syntax'
opt.foldenable = false
opt.swapfile = false
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = 'unnamed'
opt.incsearch = true
opt.hlsearch = true
opt.shortmess:remove("F"):append("c")
opt.background = 'dark'
opt.termguicolors = true
opt.hidden = true
opt.wildignore = {
	".git",
	"*/node_modules/*",
	"*/target/*",
	".metals",
	".bloop",
	".ammonite"
}
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
opt.scrolloff = 5

g.indent_blankline_use_treesitter = true

-- Highlight current pane with a 120 char board delimitation
local highlightCol = api.nvim_create_augroup("ColHighlight", { clear = true })
api.nvim_create_autocmd(
  { "WinEnter" },
  { pattern = "*", command = "set colorcolumn=120", group = highlightCol }
)

api.nvim_create_autocmd(
  { "WinLeave" },
  { pattern = "*", command = "set colorcolumn=0", group = highlightCol }
)

-- Detect whitespace
local swDetect = api.nvim_create_augroup("DetectWhitespace", { clear = true })
api.nvim_create_autocmd(
  { "BufEnter" },
  { pattern = "*", command = "lua require('noite.functions').match_trailing_whitespace()"}
)

cmd([[hi Whitespace ctermfg=red ctermbg=red]])

f.map('n', '<leader>w', [[<cmd>lua require("noite.functions").trim_whitespaces()<CR>]])

--coc
cmd([[autocmd FileType json syntax match Comment +\/\/.\+$+]])