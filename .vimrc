set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap ,b :FufBuffer<CR>
"nmap ,f :FufFile<CR>
nmap ,f :FufFileWithFullCwd **/<CR>
nmap ,w :bd<CR>
set guifont=Consolas:h12:cANSI
color buddy 
set shortmess+=A
set ic
map <c-f> :call JsBeautify()<cr>
let g:fuf_help_cache_dir = ''
let g:fuf_tag_cache_dir = ''
let g:fuf_taggedfile_cache_dir = ''
let g:airline_powerline_fonts = 1
