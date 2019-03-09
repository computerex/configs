set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'ternjs/tern_for_vim'
Plugin 'dgraham/vim-eslint'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'c9s/phpunit.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
"Plugin 'shawncplus/phpcomplete.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sickill/vim-monokai'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimproc.vim'
"Bundle 'L9'
Plugin 'tpope/vim-fugitive'
" Track the engine.
Plugin 'vim-syntastic/syntastic'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode'
"Plugin 'kien/ctrlp.vim'
Plugin 'zcodes/vim-colors-basic'
Plugin 'dikiaap/minimalist'
"Plugin 'othree/xml.vim'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'StanAngeloff/php.vim'
Plugin 'peitalin/vim-jsx-typescript'
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
"set guifont=Fira\ Mono\ For\ Powerline:h14
set shortmess+=A
set ic
nmap <leader>ne :NERDTree<cr>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
filetype plugin on

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']

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

"nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>setjs :set filetype=javascript<cr>
nnoremap <leader>setft :set filetype=
nnoremap <leader>qa :bufdo bd<cr>

set t_Co=256
syntax on
syntax enable
set background=dark
colorscheme afterglow
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
set omnifunc=syntaxcomplete#Complete
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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exe = 'eslint'


au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.cs setf cs 

nnoremap <F5> :silent! bufdo e<cr>
set confirm

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
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\dist\\*,*\\node_modules\\*

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|dll))$'

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guioptions-=m  "remove left-hand scroll bar

nnoremap <leader>sp :setlocal spell spelllang=en_us <cr>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

au FileType markdown nnoremap <leader>figure :-1read ~/snippets/figure.txt<cr>
au FileType markdown nnoremap <leader>newpost :-1read ~/snippets/newpost.txt<cr>
au FileType markdown nnoremap <leader>tlist :-1read ~/snippets/tasklist.txt<cr>
au FileType markdown nnoremap <leader>link :-1read ~/snippets/link.txt<cr>
au FileType markdown nnoremap <leader>post :silent !./post.sh<cr>

nmap <F2> i<C-R>=strftime("%FT%T%z")<CR><Esc>
imap <F2> <C-R>=strftime("%FT%T%z")<CR>

augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END


nnoremap <leader>paste "*p
let g:pymode_breakpoint_bind = '<leader>bp'

au FileType javascript nmap <leader>def :TernDef<cr>
au FileType javascript nmap <leader>doc :TernDoc<cr>
au FileType javascript nmap <leader>type :TernType<cr>
au FileType javascript nmap <leader>refs :TernRefs<cr>
au FileType javascript nmap <leader>rename :TernRename<cr>


let g:ackprg = 'ag --vimgrep'

 autocmd VimEnter * nested :call tagbar#autoopen(1)
 autocmd FileType php nested :call tagbar#autoopen(0)

function! SociPHPTest()
  let fName = expand('%')[5:]
  execute "!./tp.sh " . fName
endfunc

function! SociJSTest()
  let fName = expand('%')[5:]
  execute "!./tjs.sh " . fName
endfunc

au FileType javascript nnoremap <silent> <Leader>ta :call SociJSTest()<cr>
au FileType javascript nnoremap <silent> <Leader>tf :call SociJSTest()<cr>
au FileType php nnoremap <silent> <Leader>ta :call SociPHPTest()<cr>
au FileType php nnoremap <silent> <Leader>tf :!./tp.sh --group failing<cr>

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType javascript set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
nnoremap <Leader>b :Buffers<cr>


function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction



nnoremap <C-p> :Files<cr>

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })
nnoremap <leader>f :Ag<cr>


nnoremap <S-j> 3j
nnoremap <S-k> 3k

nnoremap <leader>nf :NERDTreeFind<CR>
