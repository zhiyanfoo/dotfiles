set nocompatible
filetype off                  
set autoindent
set showcmd
set number
set cmdheight=2
set ruler
set wildmode=longest,list,full
set wildmenu

"set t_Co=256

set background=dark
colorscheme molokai
if has('gui_running')
    colorscheme solarized
else
    colorscheme molokai
endif
" enables buffers to be switched without saving
set hidden
syntax on
set softtabstop=4
set shiftwidth=4 
set tabstop=4
set expandtab

set guifont=Monaco:h11

"supress Conque's warning messages
let g:ConqueTerm_StartMessages = 0

"keep undo history after file closes
set undofile
set undodir=/home/zhiyan/.vimundo/

autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-commentary'

Plugin 'wesQ3/vim-windowswap'

Plugin 'kwbdi.vim'

Plugin 'wincent/command-t'

Plugin 'dermusikman/sonicpi.vim'

Plugin 'tpope/vim-repeat'

Plugin 'svermeulen/vim-easyclip'

Plugin 'suan/vim-instant-markdown'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"

" PLUGIN CONFIGS
" -----------------------------------------------------------------

let g:CommandTTraverseSCM = 'pwd'

" MAPPINGS
" -----------------------------------------------------------------


let mapleader = " "

nnoremap - O<esc>

"undo undo
nnoremap <S-U> <C-R>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"x doesn't override default register
"nnoremap x "_x
"vnoremap x "_x

nnoremap H ^
nnoremap L $

vnoremap H ^
vnoremap L $

vnoremap // y/<C-R>"<CR>

"move around line wrap without skipping lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

noremap <leader>n :bnext<cr>
noremap <leader>b :bprevious<cr>

nnoremap <leader>ht ihttp://

"panel switching
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

"change dir to dir of current file
nnoremap <leader>cdd :cd<space>%:p:h<cr>

"create new Conque bash shell vsp
nnoremap <leader>vt :ConqueTermVSplit bash<cr>
nnoremap <leader>ht :ConqueTermSplit bash<cr>


if has('gui_running')
else
    nnoremap <leader>z <C-Z>
endif
