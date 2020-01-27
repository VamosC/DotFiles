set number "display line number
set nocompatible "nocompatible with vi
set showmode "show bottom command or insert mode
" set mouse=a " support mouse
set encoding=utf-8
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline
set linebreak
set wrapmargin=2
set ruler
set showmatch
set hlsearch
set incsearch
set autochdir
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all plugins here (note older versions of 
" Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold' " Plugin for code folding
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe' " Plugin for code complete
Plugin 'vim-syntastic/syntastic' " Plugin for syntax checker
Plugin 'nvie/vim-flake8' " Plugin for python syntax checker
Plugin 'jnurmine/Zenburn' " Plugin for color scheme
Plugin 'altercation/vim-colors-solarized' " Plugin for color scheme
Plugin 'preservim/nerdtree' " Plugin for file tree
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive' " Plugin for a wrapper git
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on "required

" remap key bindings
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the space
nnoremap <space> za

" Enable folding
" set foldmethod=indent
" set foldlevel=99

" configuration about SimpylFold
let g:SimpylFold_docstring_preview=1
" let g:SimpylFold_fold_docstring=0
" let g:SimpylFold_fold_import=0

" indentation to follow PEP8 standards
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab | 
	\ set autoindent |
	\ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 
highlight BadWhitespace ctermfg=16 ctermbg=9 guifg=#000000 guibg=#F8F8F0

" flagging unnecessary whitespace
au BufNewFile,BufRead  *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" syntax check
syntax on "syntax highlight
let python_highlight_all=1

" python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" configuration with flake8
" Run the flake8 check every time you save a Python file
au BufWritePost *.py call flake8#Flake8()
" remap key bindings to F3
au FileType python map <buffer> <F3> :call flake8#Flake8()<CR>

" color scheme
" F5 to change the mode
set background=dark
colorscheme zenburn
call togglebg#map("<F5>")

" configuration about NERDTree
" Map key to shortcuts NERDTree 
map <C-n> :NERDTreeToggle<CR>

