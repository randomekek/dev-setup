:map q :conf q<CR>
:map f zfa{
:map F zo
:map <C-V> :r!cat<CR>

:inoremap / <Esc>
:inoremap ?? /

:set autoindent
:set expandtab
:set smartcase
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set nohidden
:set nowrap
:set cc=80

:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h

syntax enable
set background=light
colorscheme solarized
set t_Co=256

" Glug youcompleteme-google
" let g:ycm_filetype_specific_completion_to_disable = {'cpp': 1, 'c': 1}

function! G4diff()
  vnew
  r!G4MULTIDIFF=0 P4DIFF='diff -u' g4 diff
  set filetype=diff
  set buftype=nofile
  set bufhidden=delete
  normal! gg
endfunction
:nnoremap <C-d> :call G4diff()<CR>

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

" bling/vim-airline
:set laststatus=2

" majutsushir/tagbar
nnoremap <C-t> :TagbarToggle<CR>
