" useful vim keyboard shortcuts
" (selection)!python -c "import json, sys; print json.dumps(json.load(sys.stdin), indent=2)"

" functions
function! ExecuteBash(name, cmd)
  silent! execute "bdelete " a:name
  enew
  silent! execute "file " a:name
  normal! iLoading...
  set buftype=nofile
  redraw
  silent execute a:cmd
  normal! gg
  normal! "_dd
endfunction
function! ShowDiffAll()
  call GitDiffAll()
endfunction
function! ShowDiffSingle()
  call GitDiffSingle()
endfunction
function! GitDiffAll()
  let diff_path = expand('%:p:h')
  call ExecuteBash("diff", 'r! cd "' . diff_path . '"; git diff')
  set filetype=diff
endfunction
function! GitDiffSingle()
  let diff_path = expand('%:p:h')
  let diff_file = expand('%:p')
  call ExecuteBash("diff", 'r! cd "' . diff_path . '"; git diff ' . diff_file)
  set filetype=diff
endfunction
function! NrBufs()
  let i = bufnr('$')
  let j = 0
  while i >= 1
    if buflisted(i)
      let j+=1
    endif
    let i-=1
  endwhile
  return j
endfunction
function! CloseSplitBufferOrVim()
  if winnr('$') > 1
    wincmd c
  elseif NrBufs() == 1
    conf q
  else
    conf bw
  endif
endfunction

" local changes
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

" plugins
"=============================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'lifepillar/vim-solarized8'
Plugin 'yegappan/mru'
Plugin 'b4winckler/vim-angry'
Plugin 'ap/vim-buftabline'
Plugin 'randomekek/vim-readdir'
Plugin 'randomekek/vim-lcomplete'
call vundle#end()
filetype plugin indent on

" Lokaltog/vim-easymotion
map <Space> <Plug>(easymotion-s)
map / <Plug>(easymotion-sn)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = "asdghklqwertyuiopzxcvbnm123890-=.',;fj"
let g:EasyMotion_enter_jump_first = 1

" altercation/vim-colors-solarized
syntax enable
set background=light
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme solarized8
hi MatchParen cterm=none
set colorcolumn=80

" yegappan/mru
nnoremap <C-p> :MRU<CR>

" ap/vim-buftabline
hi TabLine cterm=none
hi TabLineFill cterm=none
hi TabLineSel cterm=reverse
let g:buftabline_indicators = 1
let laststatus=1

" ap/vim-readdir
let g:loaded_netrwPlugin = 1
nnoremap <C-o> :e %:p:h<CR>
"=============================

" allow utf8
set encoding=utf-8
setglobal fileencoding=utf-8

" disable visual bell
set novisualbell

" do not allow scrolling to top or bottom of page
set scrolloff=6

" line numbers
set number
set noruler

" smart tabs
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" misc settings
set history=2000
set nowrap

" enable persistent undo
silent ! mkdir -p /tmp/vim_undo
set undofile
set undodir=/tmp/vim_undo
set noswapfile

" buffer movement, unsaved changes are kept
set hidden
nnoremap <tab> :bn!<CR>
nnoremap <S-tab> :bp!<CR>

" highlight trailing characters
hi SpecialKey term=NONE cterm=NONE ctermbg=15 ctermfg=11
set listchars=tab:\ \ ,trail:·
set list

" make search smarter
set hlsearch
set ignorecase
set smartcase

" make backspace go through lines
set backspace=indent,eol,start

" let cursor move beyond end
set virtualedit=onemore

"" keyboard shortcuts ""

" use / to exit normal mode, make it time out fast
inoremap / <Esc>
inoremap ?? /
set timeoutlen=300
set ttimeoutlen=30

" save with minus
map - :w<CR>:nohlsearch<CR>

" make q close buffers
map q :call CloseSplitBufferOrVim()<CR>

" control-j inserts newline
map <C-j> i<CR><ESC>l

" make Y yank to end of line
nnoremap Y y$

" use x integration if $DISPLAY is set
if empty($DISPLAY) || !has('xterm_clipboard')
  map <C-V> :read!cat<CR>
  imap <C-V> <C-o>:read!cat<CR>
else 
  map <C-V> "+P
  imap <C-V> <C-r><C-o>+
  vmap <C-C> "+y
endif

" get back visual block mode
nnoremap vv <C-V>

" some shortcuts for cpp
inoremap -- ->
inoremap 90 ()
inoremap ;; ::

" show git diffs
nnoremap <C-d> :call ShowDiffAll()<CR>
nnoremap <C-d>d :call ShowDiffSingle()<CR>
