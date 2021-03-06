
" Pathogen Runtime Manager
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/vim-erlang-runtime/


" Vim Plug Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"Plug 'KabbAmine/zeavim.vim'
call plug#end()


""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""" 
" Enable folds on your file
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

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
hi NonText ctermbg=none 
hi Normal guibg=NONE ctermbg=NONE

" Vim & System Shared Clipboard
set clipboard=unnamedplus



""""""""""""""""""""""
" Misc remappings
""""""""""""""""""""""
" Map ctrl keys so that i can navigate 
" with standard vim mappings
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"Command :Sw will save a file even if not opened as sudo
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Enter now makes a new line beneath the cursor
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"g is the command leader
let mapleader=";"

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
let g:syntastic_cpp_config_file='.syntastic_cpp_config'

