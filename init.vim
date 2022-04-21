set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
Plugin 'tmhedberg/SimpylFold'
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'andviro/flake8-vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'puremourning/vimspector'
Bundle 'chase/vim-ansible-yaml'
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sbdchd/neoformat'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim', { 'name': 'dracula' }
" js
Plugin 'dense-analysis/ale'

" ...
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Vim Script
set splitbelow
set splitright
let g:rainbow_active = 1
set colorcolumn=88
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Move between the splits without using mouse

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <C-F3> :Autoformat<CR>
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
autocmd BufWinEnter * NERDTreeMirror
au FileType c,cpp,html,css setlocal softtabstop=2 shiftwidth=2 tabstop=4 expandtab
au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab

set encoding=utf-8
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
call togglebg#map("<S-1>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undoir
set undofile
set incsearch
set clipboard=unnamedplus
set mouse=a
map <C-g> :NERDTreeToggle<CR>
" Comment 

let NERDTreeShowHidden=1
set clipboard=unnamedplus
nnoremap <M-k> :m-2<CR>
nnoremap <M-j> :m+<CR>
inoremap <M-k> <Esc>:m-2<CR>
inoremap <M-j> <Esc>:m+<CR>
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
"" Nerd tree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Tab configure
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
set relativenumber

"" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <S-F5> :VimspectorReset<CR>
sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
"" thoughbot
set cindent
autocmd filetype cpp nnoremap <F7> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>
map <F8> :<C-U>!./%:r<CR>
"" Cursor shape
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

let g:neoformat_enabled_javascript = ['prettier', 'eslint_d']

" fzf
noremap ` :Files<CR>

" bind \ (backward slash) to grep shortcut
nnoremap F :Ag <C-R><C-W><CR>
nnoremap <C-k> /<C-R><C-W><CR>
nnoremap \ :Ag<SPACE>
" Setting Vim for js
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
au FileType js setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufRead *.js
    \ set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
" Flake8 rule
let g:PyFlakeOnWrite = 1

"Comment code
autocmd FileType apache setlocal commentstring=#\ %s
" gruvbox background
" set background=dark
" colorscheme gruvbox
colorscheme dracula
" Flake8 Rule
let g:PyFlakeMaxLineLength = 100
let g:PyFlakeDisabledMessages = 'C901'
