set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:\vimfiles\bundle\Vundle.vim
call vundle#begin()
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
Plugin 'OmniSharp/omnisharp-vim'
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
set guifont=Fira\ Mono\ For\ Powerline:h14
set shortmess+=A
set ic
map <c-f> :call JsBeautify()<cr>
let g:fuf_help_cache_dir = ''
let g:fuf_tag_cache_dir = ''
let g:fuf_taggedfile_cache_dir = ''
nmap <leader>ne :NERDTree<cr>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
let g:Omnisharp_start_server = 0
" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    nnoremap <Leader>dnb :!dotnet build<CR>
    nnoremap <Leader>dnr :!dotnet run<CR>
    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    "autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=0
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
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
