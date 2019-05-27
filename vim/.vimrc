scriptencoding utf-8

set ffs=unix,dos
set nocompatible              " Disable Vi compatibility

" ============ Vundle ============
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Language
Plugin 'ap/vim-css-color'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'moll/vim-node'
Plugin 'posva/vim-vue'
Plugin 'othree/html5.vim'
Plugin 'chemzqm/wxapp.vim'
Plugin 'scrooloose/syntastic'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'rakr/vim-one'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rhysd/clever-f.vim'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'

" Follow the installation guide to compile language server. It's good
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'

" https://github.com/w0rp/ale
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" ============ Vundle ============

" line buffer
set history=100

" ============ FILE ============
" Encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencodings=utf-8
set encoding=utf-8

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set autochdir "auto change dir

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" ============ FILE ============


" ============ TEXT (Tab & Indent) ============
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab
set smartindent

" 1 tab == 2 spaces
set tabstop=2       " num of visual space per <TAB> char
set softtabstop=2   " num of spaces for TAB when editing, useful for backspace
set shiftwidth=2

" Insert \t char literally 
:inoremap <S-Tab> <C-V><Tab>

" Linebreak on 500 characters
set linebreak
set tw=500
set wrap
set fo+=mB " Line break support for asian language

" Indentation
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ============ TEXT (Tab & Indent) ============


" ============ UI/UX Tweaking ============
if has("cmdline_info")
    " Show the cursor line and column number
    set ruler
    " Show partial commands in status line
    set showcmd
    " Show whether in insert or replace mode
    set showmode
endif

if has('statusline')
    " Always show status line
    set laststatus=2
    " Broken down into easily includeable segments
    " Filename
    set statusline=%<%f\
    " Options
    set statusline+=%w%h%m%r
    " Current dir
    set statusline+=\ [%{getcwd()}]
    " Right aligned file nav info
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif


if has("wildmenu")
    " Show a list of possible completions
    set wildmenu
    " Tab autocomplete longest possible part of a string, then list
    set wildmode=longest,list
    if has ("wildignore")
        set wildignore+=*.a,*.pyc,*.o,*.orig
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
        set wildignore+=.DS_Store,.git,.hg,.svn
        set wildignore+=*~,*.sw?,*.tmp
    endif
endif

" UI
set display=lastline
set laststatus=2    " To display the status line always
set cursorline      " hilight current line

" line number
set number
set numberwidth=4

" change cursor type for terminal
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

" highlight matching [{()}] 
set showmatch

" Show 'invisible' characters
set list
set showbreak=\\
" Set characters used to indicate 'invisible' characters
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set listchars+=nbsp:_
"set listchars+=eol:¬

" at least 7 lines visible - when scrolling vertically using j/k
set scrolloff=5

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells

" mouse support
set mouse=a

" timeout
set timeoutlen=1000 ttimeoutlen=0
" ============ UI/UX Tweaking ============


" ============ SEARCH ============
if has("extra_search")
    " Highlight searches [use :noh to clear]
    set hlsearch
    " Highlight dynamically as pattern is typed
    set incsearch
    " Ignore case of searches...
    set ignorecase
    " ...unless has mixed case
    set smartcase
endif

" doubly esc for clear search highlight
nnoremap <esc><esc> :noh<return>
" ============ SEARCH ============


" ============ THEME (Solarized Dark & Power Line) ============
syntax enable
set t_Co=256
colorscheme one
let g:solarized_termcolors=256

if has('gui_running')
    set background=light
else
    set background=dark
    " Compatibility for Terminal
    let g:solarized_termtrans=1
    set t_Co=256
    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif

"highlight LineNr ctermfg=grey ctermbg=white

let g:airline_theme='one'

" powerline symbols
let g:airline_powerline_fonts=1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1   "开启tabline
let g:airline#extensions#tabline#buffer_nr_show = 1  "tab显示编号
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⭠'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"this line will break airline
"set ambiwidth=double
" ============ THEME (Solarized Dark & Power Line) ============

" ============ NERDTree ============
map <C-n> : NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden= 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
" ============ NERDTree ============

" ============ CtrlP ============
" Show hidden files when using ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" ============ CtrlP ============

" ============ Ssyntastic ============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
" ============ Syntastic ============

" ============ Tagbar ============
" shortcut
map <C-b> : TagbarToggle<CR>
" ============ Tagbar ============

" ============ GitGutter ============
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" ============ GitGutter ============

" ============ Clever-f ============
let g:clever_f_smart_case = 1
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
" ============ Clever-f ============


" ============ Vim-commentary ============
" <C_/>
map <C-_> : Commentary<cr>
" ============ Vim-commentary ============

" ============ KEY MAPPING ============
" system clipboard
" make sure `$ vim --version | grep clipboard` give u `+clipboard`
" otherwise you've to reinstall one with clipboard to make it work
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d
" not using system clipboard as default register
"set clipboard=unnamed

" mapping tab switch
map <S-Right> :tabn<CR>
map <S-Left>  :tabp<CR>

" mapping window switch without maximizing
"set wmw=0
"set wmh=0
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <c-h> <c-w>h<c-w>
map <c-l> <c-w>l<c-w>

" (not used, I map CAPS to ESC) insert mode mapping
" imap jk <Esc>

" multiple paste
xnoremap p pgvy

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" Make `Y` work from the cursor to the end of line (which is more logical)
nnoremap Y y$

" move cursor by display lines when wrapping
" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" ============ KEY MAPPING ============

" ============ Emmet ============
imap <C-e> <Space><BS><plug>(emmet-expand-abbr)
let g:user_emmet_install_global = 1
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \  },
  \ 'javascript' : {
  \   'extends' : 'jsx',
  \  },
  \ }
" ============ Emmet ============

" ============ vim-javascript ============
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_enable_domhtmlcss = 1

" ============ vim-jsx-pretty ============
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1
augroup JSX
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" ============ vim-vue ============
augroup Vue
  autocmd BufRead,BufNewFile *.vue setlocal filetype=html.css.vue
augroup END

set re=1
set ttyfast
set lazyredraw
