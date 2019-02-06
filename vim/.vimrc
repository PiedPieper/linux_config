
" Pathogen Runtime Manager
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/vim-erlang-runtime/

" VimPlug plugin manager
call plug#begin()
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'crusoexia/vim-monokai'
Plugin 'larsbs/vimterial_dark'
call plug#end()

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

""""""""""""""""""""""""""""""""""""""""
" Syntax Checking/Linting
""""""""""""""""""""""""""""""""""""""""
" Syntastic - populate the location list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
 
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Ale
" Set this variable to 1 to fix files when you save them.
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters = { 
            \'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \'javascript': ['eslint'],
            \} 

"Eclim settings 
set nocompatible

"""""""""""""""""""""""""
" FileTree NERDTree
"""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree


"""""""""""""""""""""""""
" EXPERIMENTAL
"""""""""""""""""""""""""
" Show preview of tag
nnoremap <Space>p :ptag <C-r><C-w><CR>
nnoremap <Space>P :pclose<CR>"
" Enable airline 
let g:airline#extensions#tabline#enabled = 1
" get rid of annoying preview window
set completeopt-=preview 

"""""""""""""
" Javascript 
"""""""""""""
autocmd FileType javascript colorscheme monokai
let g:tern#is_show_argument_hints_enabled = 1


""""""""""
" Erlang 
""""""""""
"set runtimepath^=~/.vim/bundle/vim-erlang-runtime/

"Disable Syntastic for certain file types
let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["erl"] }

" For erlang skeletons
let g:erl_author="Ryan Auger"

let g:erl_company="M2MD Technologies"

let g:erl_replace_buffer=1

let g:erl_tpl_dir="/home/ec2-user/.vim/bundle/vim-erlang-skeletons/plugin/templates"
 

"""""""""""""""""""""""""
" Load Make sure all plugins
" are in the runtimepath
"""""""""""""""""""""""""
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
 
