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

"" If the plugin manager like Vundle is not available, we need to install the plugin manually
"" And put the plugin, e.g. SimpylFold into ~/.vim/plugin/SimpylFold
"" Then uncomment the following line
"" Note: runtime can be regraded as PATH in vim
" runtime plugin/SimpylFold/plugin/SimpylFold.vim

"" Note: In vim 8+, we can put it into ~/.vim/pack/SimpylFold/start/SimpylFold
"" Then we can use it without extra editing in .vimrc! Amazing~

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

"" if nerdtree is not installed, uncomment the following two lines
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

" Naive implementation for python comment
" function! GetCharacterAt(pos)
"     let l:current_line = getline('.')
"     let l:pos_char = current_line[a:pos - 1]
"     return l:pos_char
" endfunction
"
" function! IsWhiteSpace(c)
"     return a:c =~ '\s' ? 1 : 0
" endfunction
"
" function! IsCharacterSpaceAt(pos)
"     let l:pos_char = GetCharacterAt(a:pos)
"     if IsWhiteSpace(l:pos_char)
"         return 1
"     else
"         return 0
"     endif
" endfunction
"
" function! PyCommentThisLine()
"     if IsCharacterSpaceAt(1)
"         exe "normal! 0wi" . "# " . "\<Esc>"
"     else
"         exe "normal! 0i" . "# " . "\<Esc>"
"     endif
" endfunction
" map <Leader>/ :call PyCommentThisLine()<CR>
"
" function! PyUnCommentThisLine()
"     if IsCharacterSpaceAt(1)
"         exe "normal! 0wxx" . "\<Esc>"
"     else
"         exe "normal! 0xx" . "\<Esc>"
"     endif
" endfunction
"
" unlet mapleader
" map <Leader>/ :call PyUnCommentThisLine()<CR>

function! ToggleComment()
    let l:comment_char = '#'
    let l:line = getline('.')
    if l:line =~ '^' . l:comment_char . '\s\?'
        let l:line = substitute(l:line, '^' . l:comment_char . '\s\?', '', '')
    else
        let l:line = l:comment_char . ' ' . l:line
    endif
    call setline('.', l:line)
endfunction

map <Leader>/ :call ToggleComment()<CR>
