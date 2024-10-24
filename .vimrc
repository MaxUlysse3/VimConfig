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
set foldmethod=syntax
set foldenable

colorscheme elflord
set background=dark

hi Folded ctermbg=DarkBlue
hi Folded ctermfg=LightBlue

call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'  " dependency for snipMate
Plug 'tomtom/tlib_vim'  " dependency for snipMate
Plug 'garbas/vim-snipmate'
Plug 'tikhomirov/vim-glsl'

Plug 'neoclide/coc.nvim', {'for': ['java', 'python', 'c'], 'branch': 'release'}
Plug 'kaarmu/typst.vim', {'for': ['typst']}
Plug 'ziglang/zig.vim', {'for': ['zig']}

Plug 'vim-scripts/loremipsum', {'for': ['tex']}
Plug 'vim-scripts/simplewhite.vim', {'for': ['tex']}

call plug#end()

set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=no

let delimitMate_matchpairs = "(:),[:],{:}"

syntax on

filetype on
filetype plugin on
filetype indent on

let mapleader = "²"
noremap œ ²
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <Down> <C-E>
nnoremap <Up> <C-Y>
noremap <F4> <Esc>:NERDTreeToggle<CR>
noremap <F5> <Esc><C-w>t:q<CR>
inoremap <c-s> <Esc>A
nnoremap <silent><leader>n :noh<CR>
nnoremap <silent><space> za
nnoremap <silent><leader>delete :w<CR>ggdG
nnoremap <silent><leader>tab :tabnew<CR>
nnoremap <silent>g<space> <space>gcc
noremap <silent><A-space> <Esc>
nnoremap <silent><leader>white :colorscheme simplewhite<CR>:set background=dark<CR>:set background=light<CR>
" nnoremap b :<C-U>exe "b" . v:count<CR>
" nnoremap B :buffers<CR>

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
	autocmd FileType tex inoremap <leader>e <Esc>i\left<Esc>la<space>\right<Esc>bbba

	autocmd FileType tex nnoremap <leader>li :<C-U>exe "Loremipsum " . v:count1<CR>
	autocmd FileType tex nnoremap <leader>le :Loreplace<CR>

	autocmd FileType tex ab sep \quad ; \quad
	autocmd FileType tex ab qua \quad

	autocmd FileType tex ab ensR \mathbb{R}
	autocmd FileType tex ab ensZ \mathbb{Z}
	autocmd FileType tex ab ensN \mathbb{N}
	autocmd FileType tex ab ensQ \mathbb{Q}
	autocmd FileType tex ab ensD \mathbb{D}
	autocmd FileType tex ab ensC \mathbb{C}
	autocmd FileType tex ab ens0 \varnothing

	autocmd FileType tex ab equ \Leftrightarrow
	autocmd FileType tex ab qqs \forall
	autocmd FileType tex ab ex \exists
	autocmd FileType tex ab inc \subset
	autocmd FileType tex ab ninc \not\subset
	autocmd FileType tex ab in \in
	autocmd FileType tex ab nin \notin
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
	autocmd FileType tex ab inf \infty
	autocmd FileType tex ab ln \ln
	autocmd FileType tex ab item \item
	autocmd FileType tex ab rnd \circ
	autocmd FileType tex ab tend \xrightarrow[

	autocmd FileType tex let delimitMate_quotes = "\""
augroup end

augroup cpp
	autocmd!
	autocmd BufNewFile main.cpp 0r ~/.vim/skeletons/main_skeleton.cpp

	autocmd FileType cpp nnoremap <F8> :!cmake --build ../build/<CR>:!../build/a.out<CR>
	autocmd FileType cpp inoremap <c-z> <Esc>A;
	autocmd FileType cpp inoremap <c-b> <Esc>A {<CR><Tab><CR>}<Up><Esc>xA
	autocmd FileType cpp nnoremap <silent><leader>cmlst :tabnew CMakeLists.txt<CR>

augroup end

augroup c
	autocmd!

	autocmd FileType c nnoremap <F8> :!make<CR>:!./a.out<CR>
	autocmd FileType c inoremap <c-z> <Esc>A;
	autocmd FileType c inoremap <c-b> <Esc>A {<CR><Tab><CR>}<Up><Esc>xA

	autocmd FileType c ab inc #include
	autocmd FileType c inoremap <silent><expr> <c-@> coc#refresh()
	autocmd FileType c inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
augroup end

augroup rust
	autocmd!
	autocmd FileType rust inoremap <c-z> <Esc>A;
	autocmd FileType rust inoremap <c-b> <Esc>A {<CR><Tab><CR>}<Up><Esc>xxxxA
	autocmd FileType rust nnoremap <F8> :!cargo run<CR>
	autocmd FileType rust nnoremap <F9> :!cargo check<CR>
	autocmd FileType rust nnoremap <F12> :!cargo test<CR>
	autocmd FileType rust nnoremap <F2> :!cargo bench<CR>
	autocmd FileType rust inoremap <leader>dq [``]<Left><Left>

	autocmd FileType rust ab asq! assert_eq!
	autocmd FileType rust ab ass! assert!

	autocmd FileType rust let delimitMate_quotes = "\""

	" autocmd FileType rust inoremap <silent><expr> <c-@> coc#refresh()
	" autocmd FileType rust inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
augroup end

augroup html
	autocmd!

	autocmd FileType html let delimitMate_matchpairs = "(:),[:],{:},<:>"
augroup end

augroup asm
	autocmd!

	autocmd FileType asm nnoremap <F8> :!nasm -f elf '%:t'<CR>:!ld -m elf_i386 -s -o out '%:p:r'.o<CR>:!./out<CR>
augroup end

augroup ocaml
	autocmd!
	
	autocmd FileType ocaml let delimitMate_quotes = "\""

	autocmd FileType ocaml nnoremap <F8> :!utop -init main.ml<CR>
augroup end

augroup typst
	autocmd!

	autocmd FileType typst let delimitMate_quotes = "\""
augroup end

augroup zig
	autocmd!

	autocmd FileType zig inoremap <c-z> <Esc>A;
	autocmd FileType zig inoremap <c-b> <Esc>A {<CR><Tab><CR>}<Up><Esc>xA
augroup end
