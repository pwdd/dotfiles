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
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-syntastic/syntastic'

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
let base16colorspace=256  " Access colors present in 256 colorspace

" change RED words in solarized theme
" change search highlight
augroup vimrc
  autocmd!
  autocmd ColorScheme * hi Special ctermbg=NONE ctermfg=136 | hi MatchParen cterm=NONE ctermfg=136 | hi Type ctermfg=61 | hi Search cterm=NONE ctermbg=125
augroup END

" solarized
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" tender
"if (has("termguicolors"))
"  set termguicolors
"endif
"colorscheme tender

" do not create swap files
set noswapfile

" Paste clipboard content to current line
noremap <F4> :r !pbpaste

" Enable backspace key on INSERT mode
set backspace=indent,eol,start

" Highlight current pane with a 120 char board delimitation
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

" 120 char column
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

" ================================================ lightline =====================================================

let g:lightline = {
      \ 'active': {
      \   'left': [ ['mode', 'paste'], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

set laststatus=2

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~ 'NERD_tree' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'NERD' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
" ============================================================================================================
"
" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:loaded_syntastic_java_javac_checker = 1

let g:syntastic_mode_map = { "mode": "active",
                           \ "passive_filetypes": ["scala"] }

let g:syntastic_scala_scalastyle_jar = "/usr/local/Cellar/scalastyle/0.8.0/libexec/scalastyle_2.11-0.8.0-batch.jar"
let g:syntastic_scala_scalastyle_config_file = "/usr/local/etc/scalastyle_config.xml"

let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_scala_checkers=['fsc', 'scalac', 'scalastyle']

nnoremap <Leader>sc :SyntasticCheck<Enter>

