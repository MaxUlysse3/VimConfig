set nu
set rnu

set tabstop=4
set shiftwidth=4

set hlsearch
set incsearch
set autoindent
set smartindent
set scrolloff=10
set nowrap

colorscheme elflord
set background=dark

call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'  " dependency for snipMate
Plug 'tomtom/tlib_vim'  " dependency for snipMate
Plug 'garbas/vim-snipmate'

Plug 'neoclide/coc.nvim', {'for': ['java', 'python'], 'branch': 'release'}

call plug#end()

set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=no

syntax on

filetype on
filetype plugin on
filetype indent on

let mapleader = "²"
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <Down> <C-E>
nnoremap <Up> <C-Y>
noremap <F4> <Esc>:NERDTreeToggle<CR>
noremap <F5> <Esc><C-w>t:q<CR>
inoremap <c-s> <Esc>A
nnoremap <leader>n :noh<CR>

let g:snipMate = {}
let g:snipMate = { 'snippet_version' : 1 }

abc

augroup tex
	autocmd!
	autocmd BufRead,BufNewFile *.tex setlocal filetype=tex

	autocmd FileType tex nnoremap <F8> :!pdflatex *.tex<CR>

	autocmd FileType tex inoremap <leader>( \left(
	autocmd FileType tex inoremap <leader>) \right)
	autocmd FileType tex inoremap <leader>{ \left{
	autocmd FileType tex inoremap <leader>} \right}
	autocmd FileType tex inoremap <leader>[ \left[
	autocmd FileType tex inoremap <leader>] \right]

	autocmd FileType tex ab sep \quad ; \quad
	autocmd FileType tex ab qua \quad

	autocmd FileType tex ab ensR \mathbb{R}
	autocmd FileType tex ab ensZ \mathbb{Z}
	autocmd FileType tex ab ensN \mathbb{N}
	autocmd FileType tex ab ensQ \mathbb{Q}
	autocmd FileType tex ab ensD \mathbb{D}
	autocmd FileType tex ab ensC \mathbb{C}
	autocmd FileType tex ab ens0 \varnothing

	autocmd FileType tex ab <=> \Leftrightarrow
	autocmd FileType tex ab qqs \forall
	autocmd FileType tex ab ex \exists
	autocmd FileType tex ab inc \subset
	autocmd FileType tex ab in \in
	autocmd FileType tex ab mult \times
	autocmd FileType tex ab dif \neq
	autocmd FileType tex ab => \Rightarrow
	autocmd FileType tex ab scal \cdot
	autocmd FileType tex ab <= \leq
	autocmd FileType tex ab >= \geq
	autocmd FileType tex ab env= \approx
	autocmd FileType tex ab -> \rightarrow
	autocmd FileType tex ab unn \cup
	autocmd FileType tex ab Unn \bigcup
	autocmd FileType tex ab itr \cap
	autocmd FileType tex ab Itr \bigcap
augroup end

augroup cpp
	autocmd!
	autocmd BufNewFile main.cpp 0r ~/.vim/skeletons/main_skeleton.cpp

	autocmd FileType cpp nnoremap <F8> :!cmake --build ../build/<CR>:!../build/a.out<CR>
	autocmd FileType cpp inoremap <c-z> <Esc>A;
	autocmd FileType cpp inoremap <c-b> <Esc>A {<CR><Tab><CR>}<Up><Esc>xA

augroup end

augroup java
	autocmd!
	
	autocmd FileType java setlocal signcolumn=yes

	autocmd FileType java nnoremap <F8> :!javac -d ../build/ ./net/maxulysse/main/Main.java<CR>:!java --class-path ../build/ net.maxulysse.main.Main<CR>
	autocmd FileType java inoremap <c-z> <Esc>A;

	autocmd FileType java "coc-java": ">=1.4.12",
	autocmd FileType java "coc-java-debug": ">=0.1.4",

	autocmd FileType java inoremap <silent><expr> <c-@> coc#refresh()
	autocmd FileType java inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
augroup end

augroup python
	autocmd!

	autocmd FileType python setlocal signcolumn=yes
	
	autocmd FileType python nnoremap <F8> :!python3 '%:t'<CR>

	autocmd FileType python inoremap <silent><expr> <c-@> coc#refresh()
	autocmd FileType python inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

augroup end
