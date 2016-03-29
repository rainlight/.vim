" Configuration file for vim
set modelines=0		" CVE-2007-2438

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

" Indent info
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline

" taglist info, help taglist.txt
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

" WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

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
