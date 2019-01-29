" NOTICE WILL REMOVE TRAILING WHITESPACE ON CERTAIN FILES WHEN SAVED

" BASIC CONFIG
" -----------------------------------------------------------------
set nocompatible
" set autoindent
set showcmd
set number
set cmdheight=1
set ruler
set wildmode=longest,list,full
set wildmenu
set smartcase
set splitbelow
set splitright
set textwidth=96
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

set undodir=~/.config/nvim/undodir
set undofile
" So crontabs can be edited with crontab -e

autocmd filetype crontab setlocal nobackup nowritebackup
" keeps lines at the bottom always
set scrolloff=5
if has('gui_running')
    set background=light
    colorscheme solarized
    autocmd InsertEnter * set formatoptions+=a
    autocmd InsertLeave * set formatoptions-=a
elseif !has('nvim')
    set term=xterm-256color
endif

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

filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'rust-lang/rust.vim'

if exists("g:more_features_checker")
    Plugin 'Valloric/YouCompleteMe'
    " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
    " let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    " let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
    let g:ycm_key_list_select_completion   = ['<tab>', '<Down>']
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_global_ycm_extra_conf = ''
    let g:ycm_show_diagnostics_ui = 0



    " Plugin 'ervandew/supertab'
    " let g:SuperTabDefaultCompletionType    = '<C-n>'
    " let g:SuperTabCrMapping                = 0

    Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<C-j>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    let g:UltiSnipsEditSplit="vertical"
endif

Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-abolish'
Plugin 'wesQ3/vim-windowswap'
" required from vim-easyclip
Plugin 'tpope/vim-repeat'
Plugin 'svermeulen/vim-easyclip'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/UnconditionalPaste'
" underline text for numpy doc for example
Plugin 'drmikehenry/vim-extline'
"keep window on buffer delete
Plugin 'kwbdi.vim'
Plugin 'terryma/vim-multiple-cursors'
" gives you ability to diff swp files during recovery
Plugin 'chrisbra/Recover.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-surround'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/vim-jsx-improve'

if has('nvim')
    Plugin 'neovimhaskell/haskell-vim'
endif

Plugin 'maxbrunsfeld/vim-emacs-bindings'
Plugin 'Vimjas/vim-python-pep8-indent'

"idris mode
Plugin 'idris-hackers/idris-vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'universal-ctags/ctags'
" nnoremap <buffer> <silent> <LocalLeader>dd 0:call search(":")<ENTER>b:call IdrisAddClause(0)<ENTER>w

" both lh-vim-lib and local_vimrc belong together.
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

Plugin 'nvie/vim-flake8'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'leafgarland/typescript-vim'
" nnoremap \d <Nop>
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
filetype on
filetype plugin indent on

" PLUGIN CONFIGS
" -----------------------------------------------------------------

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:typescript_indent_disable = 1


" MODES
" -----------------------------------------------------------------

func! WordProcessorMode()
    setlocal spell spelllang=en_us
    set vb t_vb=
endfu
com! WP call WordProcessorMode()

" MAPPINGS
" -----------------------------------------------------------------

let mapleader = ","

let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 0
nnoremap - O<esc>

"undo undo
nnoremap <S-U> <C-R>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" shared vimrc
nnoremap <leader>evs :edit ~/.vimrc<cr>

nnoremap H ^
nnoremap L $

vnoremap H ^
vnoremap L $h

"move around line wrap without skipping lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

noremap <leader>nn :bnext<cr>
noremap <leader>pp :bprevious<cr>

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

nnoremap <leader>hh :noh<cr>

" set spell
nnoremap <leader>sp :set spell spelllang=en<cr>
nnoremap <leader>spn :set nospell<cr>

" printing
" generate pdf `:hardcopy > myfile.ps`  then `ps2pdf your_ps_file.ps`

" fzf mappings

nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-m> :Buffers<cr>
let g:fzf_layout = { 'down': '~40%' }

" remove trailing whitespace http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nnoremap q: <Nop>
nnoremap <F1> <Nop>


" remove automatic insertion of comments after a comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent
endif

autocmd FileType c,cpp,java,php,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" search file contents with command Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <c-a> :Ag<cr>
nnoremap <c-s> :Tags<cr>

imap jk <esc>

set exrc
set secure

let g:ultisnips_javascript = {
     \ 'keyword-spacing': 'always',
     \ 'semi': 'never',
     \ 'space-before-function-paren': 'always',
     \ }
