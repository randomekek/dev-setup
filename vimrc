source /usr/share/vim/google/google.vim
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

:syntax on

" pane movement
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h

" buffer movement
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>

Glug youcompleteme-google
let g:ycm_filetype_specific_completion_to_disable = {'cpp': 1, 'c': 1}

function! G4diff()
  vnew
  r!G4MULTIDIFF=0 P4DIFF='diff -u' g4 diff
  set filetype=diff
  set buftype=nofile
  set bufhidden=delete
  normal! gg
endfunction
:nnoremap <C-d> :call G4diff()<CR>

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
:let g:airline_inactive_collapse = 0
:let g:airline#extensions#whitespace#enabled = 0
:let g:airline_section_b = ''
:let g:airline_section_c = '%t'
:let g:airline_section_x = ''
:let g:airline_section_y = ''
:let g:airline_section_z = '%l'
:let g:airline_left_sep = ''
:let g:airline_right_sep = ''
:let g:airline#extensions#tabline#enabled = 1
:let g:airline#extensions#tabline#buffer_idx_mode = 1
:let g:airline#extensions#tabline#fnamemod = ':t'
:let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" majutsushir/tagbar
nnoremap <C-t> :TagbarToggle<CR>

syntax enable
set background=light
colorscheme solarized
set t_Co=256
