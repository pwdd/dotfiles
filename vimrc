set nocompatible
filetype off

" Plugins - vim-plug
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'guns/vim-clojure-static'
Plug 'Raimondi/delimitMate'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/derekwyatt/vim-scala.git'
Plug 'pangloss/vim-javascript'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jacoborus/tender.vim'

call plug#end()

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1


filetype plugin indent on
syntax enable

" Visual
set tabstop=2
set expandtab
set shiftwidth=2
set tw=120
set number

" solarized
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" tender
" if (has("termguicolors"))
"   set termguicolors
" endif

" colorscheme tender

let macvim_skip_colorscheme=1

" do not create swap files
set noswapfile

" Paste clipboard content to current line
noremap <F4> :r !pbpaste

" Enable backspace key on INSERT mode
set backspace=indent,eol,start

" Highlight current pane with a 80 char board delimitation
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=120
  autocmd WinLeave * set colorcolumn=0
augroup END

" NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" highlight whitespaces
function! MatchTrailingWhitespace()
  call matchadd('Whitespace', '\v\s+$')
endfunction

augroup whitespace_detect
  autocmd!
  au BufEnter * :call MatchTrailingWhitespace()
augroup END

hi Whitespace ctermfg=red ctermbg=red

" disable sounds
set vb t_vb=

" 80 char column
set colorcolumn=120

" Trim whitespaces on empty lines
fun! TrimWhitespace()
  let l:save = winsaveview()
   %s/\s\+$//e
   call winrestview(l:save)
endfun

:noremap <Leader>w :call TrimWhitespace()<CR>

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" markdown
let g:vim_markdown_folding_disabled = 1

" vim-scala
let g:scala_scaladoc_indent = 1

" copy to clipboard from vim
 set clipboard=unnamed

" controlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" search
set incsearch
set hlsearch

