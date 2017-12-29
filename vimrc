"             ,
"         /\^/`\
"        | \/   |  Ritchie Zhu
"        | |    |  @melaozhu                              hah
"        \ \    /                                         _ _
"         '\\//'   "ritchie's vimrc file"               _{ ' }_
"           ||                                         { `.!.` }
"           ||     <mailto:laozhu.me@gmail.com>        ',_/Y\_,'
"           ||  ,  <https://laozhu.me>                   {_,_}
"       |\  ||  |\                                         |
"       | | ||  | |                                      (\|  /)
"       | | || / /                                        \| //
"        \ \||/ /                                          |//
"         `\\//`   \   \./    \\   \./    \\   \./    \ \\ |/ /
"        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



"***********************************************************************"
"" Plug setup
"***********************************************************************"

"" Vi iMproved
set nocompatible

"" Download and install Vim-Plug
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"***********************************************************************"
""  Plug packages
"***********************************************************************"

call plug#begin(expand('~/.vim/plugged'))

Plug 'flazz/vim-colorschemes'                   " One stop shop for vim colorschemes
Plug 'octref/RootIgnore'                        " Set wildignore from git repo root
Plug 'scrooloose/nerdtree'                      " A tree explorer plugin for vim
Plug 'scrooloose/nerdcommenter'                 " Intensely orgasmic commenting
Plug 'Xuyuanp/nerdtree-git-plugin'              " NERDTree showing git status
Plug 'editorconfig/editorconfig-vim'            " EditorConfig plugin for Vim
Plug 'tpope/vim-fugitive'                       " Best git wrapper of all time
Plug 'airblade/vim-gitgutter'                   " Show a git diff in the gutter (sign column)
Plug 'vim-airline/vim-airline'                  " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'           " The official theme repository for vim-airline
Plug 'Raimondi/delimitMate'                     " Auto-completion for quotes, parens, brackets, etc.
Plug 'bronson/vim-trailing-whitespace'          " Highlights trailing whitespace in red
Plug 'Yggdroot/indentLine'                      " A vim plugin to display the indention levels
Plug 'sheerun/vim-polyglot'                     " A solid language pack for Vim
Plug 'gorodinskiy/vim-coloresque'               " Color preview for vim

call plug#end()
filetype plugin indent on

"***********************************************************************"
"" Basic Setup
"***********************************************************************"

"" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set bomb
set binary

"" Stop vim from creating bak and swp files
set nobackup
set noswapfile

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs, Overridden by editorconfig
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"" Visual settings
syntax on
set ruler
set number
set numberwidth=5
colorscheme molokai
set t_Co=256
set mousemodel=popup
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set noerrorbells visualbell t_vb=

"" Performance
set hidden
set ttyfast
set lazyredraw
set updatetime=250

"" Shell
if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

"" Abbreviations
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!

"***********************************************************************"
"" Mappings
"***********************************************************************"

"" Map learder
let mapleader = ','

"" Insert nav
inoremap kk <ESC>
inoremap jj <ESC>
inoremap <C-h> <left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <right>

"" Buffer nav
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>z :bp<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>x :bn<CR>
nnoremap <leader>w :bn<CR>
nnoremap <leader>c :bd<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Clean search (highlight)
nnoremap <leader><space> :noh<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
nnoremap <C-w> <C-w>w

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"***********************************************************************"
""  Plug configs
"***********************************************************************"

"" NERDTree
let g:NERDTreeWinSize=50
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=0
set wildignore+=.git
let NERDTreeRespectWildIgnore=1
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1

"" fugitive.vim
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" IndentLine
let g:indentLine_enabled=1
let g:indentLine_concealcursor=0
let g:indentLine_char='┆'
let g:indentLine_faster=1

"" vim-airline
let g:airline_theme='powerlineish'
let g:airline_highlighting_cache=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#virtualenv#enabled=1
