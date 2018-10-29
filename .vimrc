set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'		" plugin manager
Plugin 'scrooloose/nerdtree'		" file system viewer
Plugin 'pangloss/vim-javascript'	" syntax highlighting for js
Plugin 'mxw/vim-jsx'				" syntax highlighting for jsx
Plugin 'w0rp/ale'					" async linting


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" NERDTree settings
autocmd vimenter * NERDTree 	" open tree on startup
" close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" General settings
set relativenumber	" better than set number
set tabstop=4
set shiftwidth=4  " number of spaces to use for autoindenting
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

" Mappings
" CTRL-N to open file tree
map <C-n> :NERDTreeToggle<CR>
" If lines are wrapped, don't jump to next line number
nnoremap <up> g<up>
nnoremap <down> g<down>
