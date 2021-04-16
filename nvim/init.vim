"NOTE: plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
"    Plug 'chrisbra/csv.vim'
"    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
"    Plug 'simnalamburt/vim-mundo'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'airblade/vim-gitgutter'
    Plug 'honza/vim-snippets'
    Plug 'arcticicestudio/nord-vim'
"    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'preservim/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vimwiki/vimwiki'
call plug#end()

"NOTE: system clipboard? don't really remember
set clipboard+=unnamedplus

"NOTE: always center
set scrolloff=999

"NOTE: do not create the swp swo etc. files
"TODO reconsider having this. I have never used the swap files...
set noswapfile

"NOTE: save undo trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

"NOTE: hybrid line numbers
set number
set relativenumber

"NOTE: whitespace things
" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"NOTE: Show substitution while typing it. VERY USEFUL
set inccommand=nosplit

"NOTE: set leader. note the leading backslash
let mapleader = "\<space>"
nnoremap <space> <nop>

"NOTE: mappings for buffer and tab switching
nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

"NOTE: Config for chrisbra/csv.vim
augroup filetype_csv
    autocmd! 

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

"NOTE: fuzzy find for files under the cur working directory
nnoremap <leader>f :Files<cr>

" coc-vim settings
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pyright',
    \]

syntax on

colo nord

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
inoremap jk <esc>
noremap J 3j
noremap K 3k
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>/ :noh<cr>

noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k

set cuc
set cul
set colorcolumn=80

"" navigate coc-snippets with tab and shift tab
let g:coc_snippet_next = ''
let g:coc_snippet_prev = ''

inoremap <expr> <tab>
   \ pumvisible() ? "\<c-n>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
   \ "\<tab>"
inoremap <expr> <S-tab>
   \ pumvisible() ? "\<c-p>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" :
   \ "\<S-tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" neomake
"call neomake#configure#automake('nrwi', 500)
"let g:neomake_open_list = 2

" tagbar
nnoremap <leader>t :TagbarToggle<cr>

let g:indentLine_enabled = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'+',
                \ 'Untracked' :'',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
