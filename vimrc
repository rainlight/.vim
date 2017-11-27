" Configuration file for vim
set modelines=0		" CVE-2007-2438

set encoding=utf-8

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup

" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Syntax info, :help syntax.txt
set hls
syntax enable
syntax on
colorscheme desert

set cursorline

" taglist info, help taglist.txt
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

" WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Indent setting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" Cscope
:set cscopequickfix=s-,c-,d-,i-,t-,e-

" Mini buffer 
let g:miniBufExplMapCTabSwitchBufs=1

" c/h file exchange 
"let g:alternateExtensions_cpp = "H"  " When used in c plus plus
"let g:alternateExtensions_H = "cpp"

" new-omni-completion
filetype plugin indent on
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" My personal prefer
:map <C-a> <C-]>
:map <C-z> <C-T>
let g:go_version_warning = 0

" Vundle running
" :PluginInstall to install packages
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " Vundle manager itself
Plugin 'fatih/vim-go'      " vim-go for golang
Plugin 'Yggdroot/indentLine'
"Plugin 'tmhedberg/SimpylFold' " Folding
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on

function AddTitle()
    call append(0, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(3, "############################################################")
    call append(4, "#                                                           ")
    call append(5, "# Copyright (C)2017 SenseDeal AI, Inc. All Rights Reserved  ") 
    call append(6, "#                                                           ")
    call append(7, "############################################################")
    call append(8, "")
    call append(9, "'''                                                       ")
    call append(10, "File: ".expand("%:t")                                     )
    call append(11,"Author: liuyuliang                                        ")
    call append(12,"Email: lyl@sensedeal.ai                                   ")
    call append(13,"Last modified: ".strftime("%Y-%m-%d %H:%M")                )
    call append(14,"Description:                                              ")
    call append(15, "'''")
endf

map <C-m> :call AddTitle()<cr>
map <C-n> :call UpdateTitle()<cr>

function UpdateTitle()
    normal m'
    execute '/Last modified: /s@:.*$@\=": ".strftime("%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/File: /s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
