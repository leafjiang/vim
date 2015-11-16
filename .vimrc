" Installation instructions
" cd ~
" git clone https://github.com/leafjiang/vim.git
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" mvim or vim
" :BundleInstall


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" File explorer
Plugin 'scrooloose/nerdtree'
" Smart selection of closest objects
Plugin 'gcmt/wildfire.vim'
" Python mode
Plugin 'klen/python-mode'
" Autocompletion tool for VIM
Plugin 'davidhalter/jedi-vim'
" Tab completion (rather than crl+space)
Plugin 'ervandew/supertab'
" Nice vim status line
Plugin 'bling/vim-airline'
" Easy comment/uncommenting
Plugin 'scrooloose/nerdcommenter'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Jedi-vim
" Completion <C-Space>
" Goto assignments <leader>g (typical goto function)
" Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
" Show Documentation/Pydoc K (shows a popup with assignments)
" Renaming <leader>r
" Usages <leader>n (shows all the usages of a name)
" Open module, e.g. :Pyimport os (opens the os module)



" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Ignore some warnings: max line length, and whitespace after comma,
" whitespace around operator
let g:pymode_lint_options_pep8 =
        \ {'max_line_length': 120,
	\  'ignore': 'E231, E225'}
" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0





" Change color scheme
" Color schemes can be found here /usr/share/vim/vim73/colors
:colorscheme desert

" Change leader key
let mapleader=","

" Bind 'e to nerdtree
nnoremap <leader>e :NERDTreeFind<CR>

" Fast way of folding code
nnoremap <Space> za

" Fast way of scrolling up and down through text
" nnoremap J <C-d>
" vnoremap J <C-d>
" nnoremap K <C-u>
" vnoremap K <C-u>

" Fast way of saving files
nnoremap s :w<CR>

" Jump fast between buffers
map H :bp<cr>
map L :bn<cr>

" Enable syntax-based code folding
" :setlocal foldmethod=syntax
autocmd FileType c setlocal foldmethod=syntax

" Word wrap without line breaks
" :set wrap linebreak nolist

" Fast way of typing ESC key.  Ctrl+[ also works by default.
" Also added a 'save document' after ESCing from insert mode.
inoremap jk <Esc>:w<CR>

" Close buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

abbr hte the

" Do not convert the tab (for makefiles)
" autocmd FileType make setlocal noexpandtab

"This unsets the 'last search pattern' register by hitting return
"nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Diff current buffer and the original file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Paste multiple times
xnoremap p pgvy

" Kill buffer without killing window split
"command Bd bp\|bd \#

" Remap window command
nnoremap <leader>w <C-w>

" Line break in normal mode
" <NL> = ctrl-j
" complement to shift-j, which joins two lines
" :nnoremap <NL> i<CR><ESC>
:nnoremap <NL> o<ESC>

" Fix Nerdtree error
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" pymode#folding#expr is slow
" disable it
let g:pymode_folding = 0
