" VIM-PLUG CONFIG
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Must be last one
Plug 'ryanoasis/vim-devicons'

call plug#end()


" DEOPLETE CONFIG
let g:deoplete#enable_at_startup = 1
let g:deoplete#source#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#source#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#rust#racer_binary = '/home/zipkr/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/zipkr/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" NERDTREE CONFIG
" Nerdtree auto open on non specified file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerdtree map to CTRL + O
map <C-o> :NERDTreeToggle<CR>

" Enable hybrid line numebrs in NERDTREE
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


" VIM CONFIG
" Hybrid line numbers
set number relativenumber

" Syntax
syntax on

" Use tab key for 2 space characters
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Remab visual tab & shift tab to indent and dedent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Remab insert jk to esc
imap jk <ESC>

" Disable scratch preview
set completeopt-=preview

let g:airline_powerline_fonts=1

colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
