:map q :call CloseBufferOrVim()<CR>
:map f zfa{
:map F zo
:map <C-V> :r!cat<CR>

:inoremap / <Esc>
:inoremap ?? /

" to copy to ubuntu clipboard: "+yy
" smart tabs
:set autoindent
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2

" ignore case
:set ignorecase
:set smartcase

" cheat codes faster
:set timeoutlen=220
:set ttimeoutlen=20

" netrw config
:let g:netrw_hide=1
:nnoremap <C-o> :Explore<CR>

" misc settings
:set hidden
:set nowrap
:set cc=80
:set history=2000
:set backspace=2

" enable undo of closed files
set undofile
set undodir=/tmp/.vim_undo_randomekek

" pane movement
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h

" buffer movement, unsaved changes are kept
nnoremap <tab> :bn!<CR>
nnoremap <S-tab> :bp!<CR>

" quit vim
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
function! CloseBufferOrVim()
  if NrBufs() == 1
    conf q
  else
    conf bw
  endif
endfunction

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'blerins/flattown'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" bling/vim-airline
:set laststatus=0
:let g:airline_inactive_collapse = 0
:let g:airline#extensions#whitespace#enabled = 0
:let g:airline#extensions#tabline#enabled = 1
:let g:airline#extensions#tabline#buffer_idx_mode = 1
:let g:airline#extensions#tabline#fnamemod = ':t'

" colors
let &t_8f="\e[38;2;%ld;%ld;%ldm"                                                                   
let &t_8b="\e[48;2;%ld;%ld;%ldm"                                                                   
set guicolors                                                                                      
syntax enable                                                                                      
colorscheme flattown

" highlight trailing spaces
set list
set listchars=tab:\ \ ,trail:·

" show and hide search highlight
:set hlsearch
:nnoremap <C-l> :nohlsearch<CR><C-l>
