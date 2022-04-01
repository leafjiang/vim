" Run vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Indent with space rather than tab character
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Turn off auto-indent when pasting code
set paste

" Fold by syntax with zr and zm commands
" For C++
set foldmethod=syntax
" For Python
"set foldmethod=indent

" Fix cut and paste between applications
"   For Google Cloud Platform
set clipboard=unnamedplus
"   For Mac OS
set clipboard=unnamed
