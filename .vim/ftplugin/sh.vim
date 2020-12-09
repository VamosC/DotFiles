unlet! b:is_sh
unlet! b:is_kornshell
let b:is_bash = 1

runtime! syntax/sh.vim

let b:current_syntax = 'bash'

setlocal autoindent
setlocal textwidth=79
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
