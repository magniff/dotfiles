set nocompatible " be iMproved, requirelet mapleader = "\<Space>"
filetype off     " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required
Plugin 'https://github.com/flazz/vim-colorschemes.git'

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'https://github.com/kien/ctrlp.vim.git'

"---------=== Markdown ===------------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " lean & mean status/tabline for vim that's light as air
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'git://github.com/altercation/solarized.git'

"--------------=== Snippets support ===---------------
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

"---------------=== Languages support ===-------------
Plugin 'scrooloose/syntastic'           " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'           " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'          " Sparkup (XML/jinja/htlm-django/etc.) support

" --- Clojure ---
Plugin 'tpope/vim-fireplace'            " Clojure completion
Plugin 'guns/vim-clojure-highlight'     " Highlighting code
Plugin 'guns/vim-clojure-static'        " Highlighting for static types

"" --- Erlang ---
Plugin 'jimenezrick/vimerl'             " The Erlang plugin for Vim
"" --- GO ---
Plugin 'fatih/vim-go'

" --- CSS ---
Plugin 'JulesWang/css.vim'              " CSS syntax file
Plugin 'groenewege/vim-less'            " Vim syntax for LESS (dynamic CSS)

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'        " Vastly improved Javascript indentation and syntax support in Vim

" --- HTML ---
Plugin 'othree/html5.vim'               " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'            " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" --- Python ---
Plugin 'davidhalter/jedi-vim'           " Awesome Python autocompletion with VIM
Plugin 'hynek/vim-python-pep8-indent'   " PEP8 indent
Plugin 'https://github.com/nvie/vim-flake8.git'
Plugin 'Chiel92/vim-autoformat'

" --- Rust ---
Plugin 'rust-lang/rust.vim'             " Vim support for Rust file detection and syntax highlighting
Plugin 'racer-rust/vim-racer'           " Rust code completion in vim via racer


" --- Pairing ---
Plugin 'https://github.com/jiangmiao/auto-pairs.git'


set list
set listchars=eol:↷,tab:>-,trail:~,extends:>,precedes:<

" Remap leader key to space bar
let mapleader = "\<Space>"

" Open file on <leader>+o
nnoremap <Leader>o :CtrlP<CR>

" Tabs remap
nnoremap tk :tabnext <CR>
nnoremap tj :tabprevious <CR>
nnoremap tn :tabnew <CR>


" Save file on <leader>+w
nnoremap <Leader>w :w<CR>

" Copy and paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" --- Indentation ---
Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
let g:indent_guides_auto_colors = 0


" --- Pairs ---
let g:AutoPairsFlyMode = 0


" --- Snippets ---
let g:UltiSnipsSnippetDirectories=["usnips"]


autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set nobackup
set nowritebackup
set noswapfile
set ic

set backspace=indent,eol,start
" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set cc=80
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast

colorscheme molokai
" set guifont=Consolas:h13
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
  set macmeta
  set lines=50 columns=125
endif
" special settings for vim
if has("mac")
  let macvim_hig_shift_movement = 1
endif

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=
if has("autocmd") && has("gui")
      au GUIEnter * set t_vb=
    endif
set novisualbell        " turn off visual bell
set noerrorbells
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set scrolloff=5         " keep some more lines for scope
set relativenumber      " relative numbering is way more convinient
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Swaps and backups
if has("win32") || has("win64")
  set dir=$TMP
  set backupdir=$TMP
else
  set dir=/tmp
  set backupdir=/tmp
endif

" Hide some panels
"set guioptions-=m  " remove menu bar
set guioptions-=T   " remove toolbar
"set guioptions-=r  " remove right-hand scroll bar

" Tab Settings
set smarttab
set tabstop=4


"NERDTree
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'egg-info', 'venv']

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" Jedi-vim
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 0         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

" Snip configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
noremap <f7> :w<CR>:SyntasticCheck<CR>


" Autoformat
noremap <F3> :Autoformat<CR>


" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'


"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- Clojure ---
autocmd FileType clj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- Erlang ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <F8> :exec '!python -i' shellescape(@%, 1)<cr>
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=1
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
      \ --max-line-length=80'

" --- Rust ---
set hidden
let g:racer_cmd = "/Users/savicvalera/racer/target/release/racer"
let $RUST_SRC_PATH = "/Users/savicvalera/rust/src"
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

