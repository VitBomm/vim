set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
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
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Vim Script
set splitbelow
set splitright
let g:rainbow_active = 1
" Move between the splits without using mouse

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
autocmd BufWinEnter * NERDTreeMirror
au FileType c,cpp,html,css,js setlocal softtabstop=2 shiftwidth=2 tabstop=4 expandtab
au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
"" au BufNewFile,BufRead *.js,.html,*.css,*.cpp
""    \ set tabstop=2 set softtabstop=2 set shiftwidth=2

autocmd FileType javascript,html set tabstop=2|set shiftwidth=2|set expandtab

set encoding=utf-8
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
call togglebg#map("<S-1>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set clipboard=unnamed
set mouse=a
map <C-n> :NERDTreeToggle<CR>
" Comment 

let NERDTreeShowHidden=1
set clipboard=unnamedplus
nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>
inoremap <S-k> <Esc>:m-2<CR>
inoremap <S-j> <Esc>:m+<CR>
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

