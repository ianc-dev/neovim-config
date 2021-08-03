set shell=/bin/bash

"tabs and breaks
set ai
set si
set wrap
set expandtab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500

"ux
set wildmenu
set ruler
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set incsearch
set hlsearch
set lazyredraw
set magic
set showmatch
set matchpairs+=<:>
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set laststatus=2
set noshowmode

" files
set t_Co=256
set background=light
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

" apperance
set t_md=
syntax on

" mappings
let mapleader = ","
let g:mapleader = ","
map j gj
map k gk
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>td :tab split<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/      " edit in new tab
map <leader>e :e %:h<cr>                            " explore in new tab
map <leader>v :setlocal paste!<cr>                  " set paste mode
map <silent> <leader><cr> :noh<cr>                  " clear search
nmap <leader>n :set number!<cr>                     " toggle line numbers
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'        " select last pasted
map <leader>cd :cd %:p:h<cr>:pwd<cr>                " set to current dir
map <leader>ss :setlocal spell!<cr>                 " enable spellcheck
map <leader>sn ]s                                   " next word
map <leader>sp [s                                   " prev word
map <leader>sa zg                                   " add word
map <leader>sc z=                                   " correct word

" buffer behavior
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" set to auto read when a file is changed from the outside
set autoread
augroup checktime
  au!
  if !has("gui_running")
    autocmd BufEnter        * silent! checktime
    autocmd CursorHold      * silent! checktime
    autocmd CursorHoldI     * silent! checktime
    autocmd CursorMoved     * silent! checktime
    autocmd CursorMovedI    * silent! checktime
  endif
augroup ENDash

set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'jparise/vim-graphql'
Plugin 'neoclide/coc.nvim'
Plugin 'prettier/vim-prettier'

let g:coc_global_extensions = ['coc-tsserver' ]

call vundle#end()
filetype plugin indent on

colorscheme griptape
