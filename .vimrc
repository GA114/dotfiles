" Required for Vundle
set nocompatible
filetype off

" rtp = runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on    " required


map <C-n> :NERDTreeToggle<CR>


syntax on
colo peachpuff
scriptencoding utf-8
set mouse=a
set backspace=indent,eol,start  " more powerful backspacing
set nocompatible
set ruler                       " show the cursor position all the time
set shell=zsh\ -l
set modeline
set modelines=3
set encoding=utf-8
set number
set nohlsearch

" Shift key compensation
command WQ wq
command Wq wq
command W w
command Q q

" Highlight eighty-first column of text
highlight ColorColumn ctermbg=magenta
command PP call matchadd('ColorColumn', '\%82v', 100)
call matchadd('ColorColumn', '\%82v', 100)
command P call clearmatches()

" Tab settings
set shiftwidth=4
set tabstop=4
set expandtab
