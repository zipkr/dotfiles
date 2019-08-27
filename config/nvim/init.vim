syntax enable
set number
set relativenumber
set autoindent
set cursorline
set lazyredraw

let g:python_host_prog  = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin()
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'solarnz/thrift.vim'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'triglav/vim-visual-increment'
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'morhetz/gruvbox'
Plug 'trevordmiller/nova-vim'
Plug 'fatih/vim-go'
call plug#end()

" extra syntax highlighting
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nnoremap <C-O> :NERDTreeToggle<ENTER>

vmap <Tab> >gv
vmap <S-Tab> <gv

inoremap jk <esc>

let g:jsx_ext_required = 0

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
au VimLeave *.go !gofmt -w %

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

set background=dark
set termguicolors
colorscheme nova
let g:airline_theme='nova'
