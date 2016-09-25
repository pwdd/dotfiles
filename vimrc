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
set tw=80
set number
set background=dark
let g:solarized_termcolors=256
colorscheme solarized 

" do not create swap files
set noswapfile

" Paste clipboard content to current line
noremap <F4> :r !pbpaste

" Enable backspace key on INSERT mode
set backspace=indent,eol,start

" Highlight current pane with a 80 char board delimitation
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=80
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
set colorcolumn=80

" Trim whitespaces on empty lines
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

:noremap <Leader>w :call TrimWhitespace()<CR>
