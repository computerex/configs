set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=C:\vimfiles\bundle\Vundle.vim
call vundle#begin('C:\vimplugins')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
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
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'scrooloose/nerdcommenter'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'vim-syntastic/syntastic'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'zcodes/vim-colors-basic'
Plugin 'dikiaap/minimalist'
Plugin 'othree/xml.vim'
Plugin 'millermedeiros/vim-esformatter'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter' 
Plugin 'suan/vim-instant-markdown'
Plugin 'ervandew/supertab'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" activates syntax highlighting among other things
syntax on
syntax enable

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
nmap ,b :FufBuffer<CR>
"nmap ,f :FufFile<CR>
nmap ,f :FufFileWithFullCwd **/<CR>
nmap ,w :bd<CR>
set guifont=Fira\ Mono\ For\ Powerline:h11
set shortmess+=A
set ic
map <c-f> :call JsBeautify()<cr>
let g:fuf_help_cache_dir = ''
let g:fuf_tag_cache_dir = ''
let g:fuf_taggedfile_cache_dir = ''
nmap <leader>ne :NERDTree<cr>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
filetype plugin on
set noshowmatch
set splitbelow
" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0 

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set number


" snippets
nnoremap <leader>meanstart :-1read ~/snippets/express.js<cr>
nnoremap <leader>meanmod :-1read ~/snippets/mongomod.js<cr>
nnoremap <leader>html :-1read ~/snippets/html.html<cr>
nnoremap <leader>meanroute :-1read ~/snippets/meanroute.js<cr>
nnoremap <leader>meanspec :-1read ~/snippets/meanspec.js<cr>
nnoremap <leader>meanvalid :-1read ~/snippets/meanvalid.js<cr>
nnoremap <leader>chaimocha :-1read ~/snippets/chaimocha.html<cr>
nnoremap <leader>mochaspec :-1read ~/snippets/mochaspec.js<cr>
nnoremap <leader>dirspec :-1read ~/snippets/tangdir.js<cr>
nnoremap <leader>conspec :-1read ~/snippets/tancon.js<cr>
nnoremap <leader>jspm :-1read ~/snippets/jspm.html<cr>
nnoremap <leader>eslintrc :-1read ~/snippets/eslintrc.js<cr>
nnoremap <leader>reactcomp :-1read ~/snippets/reactcomp.js<cr>
nnoremap <leader>imprr :-1read ~/snippets/imprr.js<cr>
nnoremap <leader>reactapp :-1read ~/snippets/reactapp.js<cr>
nnoremap <leader>andir :-1read ~/snippets/andir.js<cr>

nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>setjs :set filetype=javascript<cr>
nnoremap <leader>setft :set filetype=
nnoremap <leader>qa :bufdo bd<cr>

set t_Co=256
syntax on
syntax enable
set background=dark
colorscheme monokai
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"set omnifunc=syntaxcomplete#Complete
let g:tern#is_show_argument_hints_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>build <Plug>(go-build)
au FileType go nmap <leader>test <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>td <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>s <Plug>(go-implements)

let g:syntastic_javascript_checkers = ['eslint']
au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.cs setf cs 

nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
nnoremap <Leader>fix :Fixmyjs<cr>
nnoremap <F5> :silent! bufdo e<cr>
set confirm
set hidden
let g:fixmyjs_rc_path = 'C:\Users\mali\.eslintrc'
let g:jsx_ext_required = 0
set hlsearch
set incsearch
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <silent> <Leader>num :call NumberToggle()<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Q> <C-W><C-Q>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\dist\\*  " Windows

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|dll))$'

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

vnoremap <C-c> "*y
nnoremap <leader>p "+gP
nnoremap <leader>dos :e ++ff=dos<cr>
let g:syntastic_enable_cucumber_checker = 0
autocmd BufEnter *.md exe 'noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>'
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
:imap jk <Esc>
