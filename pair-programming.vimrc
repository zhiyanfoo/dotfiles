" BASIC CONFIG
" -----------------------------------------------------------------
set nocompatible
set autoindent
set showcmd
set number
set cmdheight=1
set ruler
set wildmode=longest,list,full
set wildmenu
set ignorecase
set smartcase
set splitbelow
set splitright
" set t_Co=256

" keeps lines at the bottom always
set scrolloff=5

set hidden
syntax on
set softtabstop=4
set shiftwidth=4 
set tabstop=4
set expandtab
set mouse=a

"system clipboard
set clipboard=unnamed

autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

filetype on

let mapleader = " "

nnoremap - O<esc>

"undo undo
nnoremap <S-U> <C-R>

nnoremap H ^
nnoremap L $

vnoremap H ^
vnoremap L $h

"move around line wrap without skipping lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

noremap <leader>nn :bnext<cr>
noremap <leader>bb :bprevious<cr>

nnoremap <leader>ht ihttp://

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-H> :TmuxNavigatePrevious<cr>

"change dir to dir of current file
nnoremap <leader>cdd :cd<space>%:p:h<cr>

" search selected test using //
vnoremap // y/<C-R>"<CR>

nnoremap cp "_dwhp

nnoremap <leader>pi :PluginInstall<CR>

nnoremap <leader>" i""""""<esc>

" set spell
nnoremap <leader>sp :set spell spelllang=en<cr>
nnoremap <leader>spn :set nospell<cr>

" generate pdf `:hardcopy > myfile.ps`  then `ps2pdf your_ps_file.ps`
