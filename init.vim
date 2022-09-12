color desert
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set cursorline

" Install Plugin Manager First
" https://github.com/junegunn/vim-plug
"
" To install a plugin, add it the the block bellow and run :PluginInstall

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree' " File Directory
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto-complete
Plug 'zchee/deoplete-jedi' " Auto-complete Python
Plug 'majutsushi/tagbar' " Tag bar
" Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder in VIM
Plug 'junegunn/fzf.vim' " Fuzzy finder in VIM
Plug 'tpope/vim-commentary' " To comment lines
Plug 'mhinz/vim-startify' " First VIM screen
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'


call plug#end()

" Key bindings
let mapleader=" "

" Fuzzy inside file, directory, vim commands and buffers
nnoremap <leader>l :BLines<CR> 
nnoremap <leader>f :Files<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>b :Buffers<CR>
" It only works with the silver search install 'sudo apt-get silvesearcher-ag' 
nnoremap <leader>s :Ag<CR>
nnoremap <leader>w :tabclose<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :TagbarToggle<CR>

" Binding for switching tabs
nnoremap H gT
nnoremap L gt

let g:deoplete#enable_at_startup = 1

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
