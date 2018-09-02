if has('python3')
  silent! python3 1
endif

set nocompatible
filetype off

" Plugins - vim-plug
call plug#begin()

Plug 'gmarik/vundle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'guns/vim-clojure-static'
Plug 'Raimondi/delimitMate'
Plug 'plasticboy/vim-markdown'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-syntastic/syntastic'
Plug 'neovimhaskell/haskell-vim'
Plug 'https://github.com/bitc/vim-hdevtools.git'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Quramy/tsuquyomi'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cloudhead/neovim-fuzzy'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" themes
Plug 'w0ng/vim-hybrid'

call plug#end()

"Code completion with Deoplete - enabled by ensime
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

syntax on
filetype plugin indent on

" Visual
set tabstop=2
set expandtab
set shiftwidth=2
set tw=120
set number
let base16colorspace=256  " Access colors present in 256 colorspace

" 120 char column
set colorcolumn=120

" hybrid theme
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" folding
set foldmethod=syntax
set nofoldenable " open files normal (not fold)

" do not create swap files
set noswapfile

" Paste clipboard content to current line
noremap <F4> :r !pbpaste

" Enable backspace key on INSERT mode
set backspace=indent,eol,start

" disable sounds
set vb t_vb=

" remap Esc
inoremap jj <Esc>

" Highlight current pane with a 100 char board delimitation
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=100
  autocmd WinLeave * set colorcolumn=0
augroup END

" NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let g:NERDTreeWinSize=30
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
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

let g:syntastic_scala_scalastyle_jar = "/usr/local/Cellar/scalastyle/1.0.0/libexec/scalastyle_2.12-1.0.0-batch.jar"
let g:syntastic_scala_scalastyle_config_file = "/usr/local/etc/scalastyle_config.xml"

let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_scala_checkers=['fsc', 'scalac', 'scalastyle']
let g:syntastic_haskell_checkers=['hdevtools']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty \<", "inserting implicit ", "unescaped \&" , "lacks \"action", "lacks value", "lacks \"src", "is not recognized!", "discarding unexpected", "replacing obsolete "]

nnoremap <Leader>sc :SyntasticCheck<Enter>

" Ensime
autocmd BufWritePost *.scala silent :EnTypeCheck

autocmd FileType scala,java
      \ nnoremap <buffer> <silent> <LocalLeader>t :EnType<CR> |
      \ xnoremap <buffer> <silent> <LocalLeader>t :EnType selection<CR> |
      \ nnoremap <buffer> <silent> <LocalLeader>T :EnTypeCheck<CR> |
      \ nnoremap <buffer> <silent> K  :EnDocBrowse<CR> |
      \ nnoremap <buffer> <silent> gd :EnDeclaration<CR> |
      \ nnoremap <buffer> <silent> <C-]>  :EnDeclaration<CR> |
      \ nnoremap <buffer> <silent> <C-w>] :EnDeclarationSplit<CR> |
      \ nnoremap <buffer> <silent> <C-w><C-]> :EnDeclarationSplit<CR> |
      \ nnoremap <buffer> <silent> <C-v>] :EnDeclarationSplit v<CR> |
      \ nnoremap <buffer> <silent> <LocalLeader>i :EnInspectType<CR> |
      \ nnoremap <buffer> <silent> <LocalLeader>I :EnSuggestImport<CR> |
      \ nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>

let g:ensime_server_v2=1

" Haskell development

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 2
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" vue
autocmd FileType vue syntax sync fromstart

" typescript - run :make
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" vim js pretty template
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

" tsuquyomi
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)

:let g:tsuquyomi_single_quote_import=1

:iabbrev clog console.log('========================');<CR> console.log(#HERE#);<CR> console.log('========================');<CR>

:iabbrev pln println("==============================")<CR> println(#HERE)<CR> println("==============================")<CR>
