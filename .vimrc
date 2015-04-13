execute pathogen#infect()
map <C-n> :NERDTreeToggle<CR>

syntax on
filetype plugin indent on
set omnifunc=complete#Complete
colo peachpuff
scriptencoding utf-8
set mouse=a
set nocompatible
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
command PP call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%81v', 100)
command P call clearmatches()

" Tab settings
set shiftwidth=4
set tabstop=4
set expandtab
