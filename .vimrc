" package manager 
set nocompatible "nocompatible with vi
" set nofoldenable
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
 
" add all plugins here
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-python/python-syntax'
Plugin 'VamosC/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree' " file system explorer
Plugin 'bling/vim-bufferline'
Plugin 'tmhedberg/SimpylFold' " python
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end() " required

filetype plugin indent on "required

" plugin configuration
syntax on
" Plugin 'vim-python/python-syntax'
let g:python_highlight_all = 1

set background=dark
" Plugin 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
set t_Co=256

" Plugin 'vim-airline/vim-airline'
let g:airline_theme = 'powerlineish'

" Plugin 'preservim/nerdtree'
let mapleader = ","
map <Leader>ne :NERDTreeToggle<CR>
" map <Leader>ne :Explore<CR>
" map <Leader>ve :Vexplore<CR>
" map <Leader>he :Hexplore<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" basic configuration
set number "display line number
set ruler
set showmode "show bottom command or insert mode
set encoding=utf-8
set hlsearch
set incsearch
set splitbelow
set cursorline "highlight current line
" hi CursorLine cterm=None ctermgb=gray ctermfg=black
" set sw=4
" set ts=4
" set expandtab

" key mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ","
nmap <Leader>nh :noh<CR>

" if nerdtree is not installed, uncomment the following two lines
" map <Leader>ne :Vexplore<CR>
" map <Leader>he :Hexplore<CR>

nnoremap <space> za

" vim/system clipboard

if has('macunix')
    let mapleader = ","
    nnoremap <Leader>p "*p
    noremap <Leader>y "*y
    nnoremap <Leader>yy "*yy
endif

" vim script
function! AddPdb(text)
    exe "normal! o" . a:text . "\<Esc>"
endfunction

let mapleader = ","
nnoremap <Leader>d :call AddPdb('import pdb; pdb.set_trace()')<CR>
" nnoremap <Leader>pdb :call AddPdb('import pdb; pdb.set_trace()')<CR>
