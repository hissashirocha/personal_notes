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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto-complete
" Plug 'zchee/deoplete-jedi' " Auto-complete Python
" Plug 'majutsushi/tagbar' " Tag bar
" Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder in VIM
Plug 'junegunn/fzf.vim' " Fuzzy finder in VIM
Plug 'tpope/vim-commentary' " To comment lines
Plug 'mhinz/vim-startify' " First VIM screen
" To make it work with Python, also run :CocInstall coc-pyright
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" nnoremap <C-t> :TagbarToggle<CR>

" Binding for switching tabs
nnoremap H gT
nnoremap L gt

" let g:deoplete#enable_at_startup = 1

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Select option in coc suggestions
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab to navegate coc suggestions
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

