
" Pathogen Runtime Manager
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/vim-erlang-runtime/

""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""" 
" Enable plugins
filetype plugin on

"Enable Syntax Highlighting 
syntax enable

"Highlight search terms
set hlsearch

"Tab Settings
set backspace=2
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Numbered files
set number

"Can move cursor anywhere
set virtualedit=all
set wildmode=longest,list,full
set wildmenu

" Enable auto-indent files
filetype indent on

" Default Colorscheme - can add different ones
" for different languages under ftplugin
colorscheme atom-dark-256

""""""""""""""""""""""
" Misc remappings
""""""""""""""""""""""
"Command :Sw will save a file even if not opened as sudo
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Enter now makes a new line beneath the cursor
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"g is the command leader
let mapleader="g"

"Printing no longer clears the buffer
xnoremap p pgvy 

"""""""""""""""""""""""""
" FileTree NERDTree
"""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1


"""""""""""""""""""""""""
" Syntastic 
"""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_c_config_file='.syntastic_c_config'

