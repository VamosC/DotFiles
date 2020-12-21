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
Plugin 'dense-analysis/ale' " asynchronous lint engine
Plugin 'Konfekt/FastFold'
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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugin 'preservim/tagbar'
let mapleader = ","
nmap <Leader>tb :TagbarToggle<CR>

" Plugin 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 0
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

" Plugin 'dense-analysis/ale' " asynchronous lint engine
" customizing the echoed message
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_lint_on_save = 0

" python linter
let g:ale_linters = {'python':['pylint', 'jedils']}
let g:ale_fixers = {'python':['isort', 'yapf']}
nmap <F2> :ALEFix<CR>

let mapleader = ","
nmap <Leader>gd :ALEGoToDefinition<CR>

" Plugin 'Konfekt/FastFold'
let mapleader = ","
nmap <Leader>ffu :FastFoldUpdate<CR>

" Plugin 'tmhedberg/SimpylFold' " python
let g:SimpylFold_fold_import=0

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
nnoremap <Leader>pdb :call AddPdb('import pdb; pdb.set_trace()')<CR>

