set nocompatible              " be iMproved, required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'		" plugin manager
Plugin 'ycm-core/YouCompleteMe'	" Autocompletion for most languages

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General settings
colorscheme slate
set relativenumber	" better than set number
set number  " also show the exact line number of the current line
set tabstop=2
set shiftwidth=2  " number of spaces to use for autoindenting
set hidden		" hide buffers instead of closing when opening new files
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set title                " change the terminal's title
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup			 " vim shouldn't be responsible for data loss 
set noswapfile
set pastetoggle=<F2>	" f2 to enter paste mode, no cascading autoindent
set autochdir 		" Set the working directory to wherever the open file lives
set autoread			" Automatically update changed files, instead of needing to use :edit
set tags=tags;	  " look for tags in current dir, then recursively to root

autocmd FileType h setlocal ts=4 sw=4
autocmd FileType cpp setlocal ts=4 sw=4

" Mappings
" change the mapleader from \ to ,
let mapleader=","
" CTRL-N to open file tree
" If lines are wrapped, don't jump to next line number
nnoremap <up> gk
nnoremap <down> gj
" Quickly search through tagged occurrences of items
nnoremap <leader>. :CtrlPTag<cr>
" copy to system clipboard
nnoremap <leader>c :%!xclip -sel clip<cr>u
nnoremap <leader>= yyp :s/./=/g<cr>/replacedeverythingforyouwith=<cr>
nnoremap <leader>- yyp :s/./-/g<cr>/replacedeverythingforyouwith-<cr>

