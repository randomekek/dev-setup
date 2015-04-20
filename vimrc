" useful vim keyboard shortcuts
" ci? - change inside ()b {}B <> [] " '
" ca? - change around brackets
" s/../../c - confirm replacements
" "2p - paste previously deleted item

" functions
function ShowDiff()
  silent! bdelete diff
  let diff_file = expand('%:p:h')
  enew
  silent execute 'r! cd "' . diff_file . '"; git diff'
  set filetype=diff
  set buftype=nofile
  silent f diff
  normal! gg
  join
endfunction
function NrBufs()
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
function CloseSplitBufferOrVim()
  if winnr('$') > 1
    wincmd c
  elseif NrBufs() == 1
    conf q
  else
    conf bw
  endif
endfunction

" plugins
"=============================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" bling/vim-airline
set laststatus=0
let g:airline_inactive_collapse = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t:s/^\([^.]\{15}\)[^.]\+\.\(.*\)/\1..\2//'
let g:airline#extensions#tabline#show_tab_type = 0

" Lokaltog/vim-easymotion
map <Space> <Plug>(easymotion-s)
map / <Plug>(easymotion-sn)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" Valloric/YouCompleteMe
let g:ycm_error_symbol = ">"
let g:ycm_warning_symbol = ">"
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" altercation/vim-colors-solarized
" let g:solarized_contrast = "high"
" let g:solarized_visibility = "high"
set t_Co=256
"=============================

" show git diffs
nnoremap <C-d> :call ShowDiff()<CR>

" make q close buffers
map q :call CloseSplitBufferOrVim()<CR>

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

" make ctrl-v paste for systems without clipboard
map <C-V> :read!cat<CR>
imap <C-V> <Esc>:read!cat<CR>

" make ctrl-v paste for systems with clipboard
" map <C-V> "+p
" imap <C-V> <Esc>:normal "+p<CR>a
" vmap <C-C> "+y

" use / to exit normal mode, make it time out fast
inoremap / <Esc>
inoremap ?? /
set timeoutlen=220
set ttimeoutlen=20

" smart tabs
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" make Y yank to end of line
nnoremap Y y$

" use netrw to open files
let g:netrw_hide=1
let g:netrw_banner=0
let g:netrw_liststyle=2
let g:netrw_cursor=0
nnoremap <C-o> :Explore<CR>

" misc settings
set hidden
set nowrap
set cc=80
set history=2000

" enable undo
silent ! mkdir -p /tmp/vim_undo
set undofile
set undodir=/tmp/vim_undo

" pane movement (search uses C-l)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" buffer movement, unsaved changes are kept
nnoremap <tab> :bn!<CR>
nnoremap <S-tab> :bp!<CR>

" colors
syntax enable
set background=light
colorscheme solarized
hi MatchParen ctermbg=none cterm=none

" trailing characters
hi SpecialKey term=NONE cterm=NONE ctermbg=15 ctermfg=11
set listchars=tab:\ \ ,trail:·
set list

" control-enter inserts newline
map <NL> i<CR><ESC>l

" make search smarter, ctrl-l clear search
set hlsearch
set ignorecase
set smartcase
nnoremap <C-l> :nohlsearch<CR><C-l>

" make backspace go through lines
set backspace=indent,eol,start
