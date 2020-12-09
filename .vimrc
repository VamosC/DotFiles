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
Plugin 'tpope/vim-fugitive' " wrapper git
Plugin 'preservim/nerdtree' " file system explorer
Plugin 'bling/vim-bufferline'
Plugin 'preservim/tagbar'
Plugin 'airblade/vim-gitgutter' " git diff
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy search
"Plugin 'tmhedberg/SimpylFold' " Plugin for code folding
"Plugin 'Valloric/YouCompleteMe' " Plugin for code complete and syntax checker
"Plugin 'vim-syntastic/syntastic' " Plugin for syntax checker
"Plugin 'nvie/vim-flake8' " Plugin for python syntax checker
"Plugin 'google/vim-maktaba'
"Plugin 'google/vim-codefmt'
"Plugin 'google/vim-glaive'

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

" Plugin 'vim-airline/vim-airline'
let g:airline_theme = 'powerlineish'

" Plugin 'preservim/nerdtree'
let mapleader = ","
map <Leader>ne :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugin 'preservim/tagbar'
let mapleader = ","
nmap <Leader>tb :TagbarToggle<CR>

" Plugin 'airblade/vim-gitgutter'
let mapleader = ","
nmap <Leader>ggd :GitGutterDisable<CR>
nmap <Leader>gge :GitGutterEnable<CR>
nmap <Leader>ggt :GitGutterToggle<CR>
nmap <Leader>gglt :GitGutterLineHighlightsToggle<CR>
nmap <Leader>ggf :GitGutterFold<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Plugin 'ctrlpvim/ctrlp.vim'
let mapleader = ","
nmap <Leader>cp :CtrlPMRU<CR>

" basic configuration
set number "display line number
set ruler
set showmode "show bottom command or insert mode
set encoding=utf-8
set hlsearch
set incsearch
set splitbelow
set cursorline "highlight current line

" key mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = ","
nmap <Leader>nh :noh<CR>

" call glaive#Install()
" Glaive codefmt plugin[mappings]
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
" 
" " split navigations
" 
" " Enable folding with the space
" nnoremap <space> za
" 
" " Enable folding
" " set foldmethod=indent
" " set foldlevel=99
" 
" " configuration about SimpylFold
" let g:SimpylFold_docstring_preview=1
" " let g:SimpylFold_fold_docstring=0
" " let g:SimpylFold_fold_import=0
" 
" 
" " python with virtualenv support
" python3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"	project_base_dir = os.environ['VIRTUAL_ENV']
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	with open(activate_this, 'r') as f:
"	    exec(f.read(), dict(__file__=activate_this))
" EOF
" 
" " configuration with flake8
" " Run the flake8 check every time you save a Python file
"  au BufWritePost *.py call flake8#Flake8()
" let g:flake8_show_in_file=1  " show
" let g:flake8_show_in_gutter=1  " show
" " remap key bindings to F3
" au FileType python map <buffer> <F4> :call flake8#Flake8()<CR>
" 
" 
" " configuration about YouCompleteMe
" " indicating the path of thirty package
" let g:ycm_python_sys_path = ['/usr/local/lib/python3.7/site-packages']
" let g:ycm_extra_conf_vim_data = [
"			\ 'g:ycm_python_sys_path'
"			\ ]
" " let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
" let g:ycm_use_clangd = 1
" let g:ycm_clangd_binary_path='/usr/local/opt/llvm/bin/clangd'
" nnoremap <leader>jd :tab split \| YcmCompleter GoTo<CR>
" 
" 
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0 " check when save the file
" au FileType python map <buffer> <F1> :call SyntasticCheck()<CR>
" 
" " copy from vim to system clipboard
" " vmap '' :w !pbcopy<CR><CR>
" vnoremap '' "+y<CR>
" 
" set laststatus=2
" set tags=tags
" nnoremap d "_d
