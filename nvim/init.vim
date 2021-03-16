call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'arcticicestudio/nord-vim'
call plug#end()

set clipboard+=unnamedplus

set scrolloff=999

" do not create the swp swo etc. files
set noswapfile

" save undo trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" hybrid line numbers
set number
set relativenumber

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show substitution
set inccommand=nosplit

" set leader
let mapleader = "\<space>"

" make space not do anything
nnoremap <space> <nop>

" mappings for buffer and tab switching
nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

" Config for chrisbra/csv.vim
augroup filetype_csv
    autocmd! 

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" Config for fzf.vim (BONUS :D)
nnoremap <leader>f :Files<cr>

" coc-vim settings
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \]

syntax on

colo nord

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
inoremap jk <esc>
nnoremap J 3j
nnoremap K 3k
nnoremap <leader>c :CHADopen<cr>

set cuc
set cul

