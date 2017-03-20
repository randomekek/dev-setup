" useful vim keyboard shortcuts
" ci? - change inside ()b {}B <> [] " '
" ca? - change around brackets
" s/../../c - confirm replacements
" "2p - paste previously deleted item
" (selection)!python -c "import json, sys; print json.dumps(json.load(sys.stdin), indent=2)"
" Use <C-o> in insert mode to enter normal mode for one command
" Use <C-p> or :MRU to see most recently closed files
" backtick for copy and paste `

" functions
function! ShowDiffAll()
  silent! bdelete diff
  let diff_path = expand('%:p:h')
  enew
  silent execute 'r! cd "' . diff_path . '"; git diff'
  set filetype=diff
  set buftype=nofile
  silent f diff
  normal! gg
  join
endfunction
function! ShowDiffSingle()
  silent! bdelete diff
  let diff_path = expand('%:p:h')
  let diff_file = expand('%:p')
  enew
  silent execute 'r! cd "' . diff_path . '"; git diff ' . diff_file
  set filetype=diff
  set buftype=nofile
  silent f diff
  normal! gg
  join
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
Plugin 'altercation/vim-colors-solarized'
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
" let g:solarized_contrast = "high"
" let g:solarized_visibility = "high"
syntax enable
set background=light
set t_Co=256
colorscheme solarized
hi MatchParen ctermbg=none cterm=none
set colorcolumn=80

" yegappan/mru
nnoremap <C-p> :MRU<CR>

" ap/vim-buftabline
hi TabLine cterm=none
hi TabLineFill cterm=none
hi TabLineSel cterm=reverse
let g:buftabline_indicators = 1

" ap/vim-readdir
let g:loaded_netrwPlugin = 1
nnoremap <C-o> :e %:p:h<CR>
"=============================

" allow utf8
set encoding=utf-8
setglobal fileencoding=utf-8

" disable visual bell
set visualbell

" do not allow scrolling to top or bottom of page
set scrolloff=6

" line numbers
set ruler
set number

" smart tabs
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" misc settings
set history=2000
set nowrap

" enable undo
silent ! mkdir -p /tmp/vim_undo
set undofile
set undodir=/tmp/vim_undo
set noswapfile

" buffer movement, unsaved changes are kept
set hidden
nnoremap <tab> :bn!<CR>
nnoremap <S-tab> :bp!<CR>

" trailing characters
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
