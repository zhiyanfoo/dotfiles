" NOTICE WILL REMOVE TRAILING WHITESPACE ON CERTAIN FILES WHEN SAVED
" BASIC CONFIG
" -----------------------------------------------------------------
set nocompatible
set showcmd
set number
set cmdheight=1
set ruler
set wildmode=longest,list,full
set wildmenu
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

Plugin 'zenbro/mirror.vim'
Plugin 'rust-lang/rust.vim'

if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'autozimu/LanguageClient-neovim'

Plugin 'tpope/vim-commentary'
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

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'maxbrunsfeld/vim-emacs-bindings'


Plugin 'shougo/deoplete.nvim'
Plugin 'Shougo/neosnippet.vim'

" Plugin 'goerz/jupytext.vim'
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
filetype off
filetype plugin indent on

" PLUGIN CONFIGS
" -----------------------------------------------------------------

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Language Server
" -----------------------------------------------------------------
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'cpp': ['clangd'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
\ }


" Minimal LSP configuration for JavaScript
" let g:LanguageClient_serverCommands = {}
" if executable('javascript-typescript-stdio')
"   let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"   let g:LanguageClient_serverCommands['typescript'] = ['javascript-typescript-stdio']
"   let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
"   let g:LanguageClient_serverCommands['typescript.tsx'] = ['javascript-typescript-stdio']

"   " Use LanguageServer for omnifunc completion
"   autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"   autocmd FileType typescript setlocal omnifunc=LanguageClient#complete
" else
"   echo "javascript-typescript-stdio not installed!\n"
" endif

" if executable('hie-wrapper')
"   let g:LanguageClient_serverCommands.haskell = ['hie-wrapper']
"   " Use LanguageServer for omnifunc completion
"   autocmd FileType haskell setlocal omnifunc=LanguageClient#complete
" else
"   echo "hie-wrapper not installed!\n"
" endif


" go to definition
nnoremap <silent> <c-]> :call LanguageClient#textDocument_definition()<CR>
" type info under cursor
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" rename variable under cursor
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <leader>lb :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>


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

autocmd FileType c,cpp,java,php,python,javascript,typescript,racket autocmd BufWritePre <buffer> %s/\s\+$//e

" search file contents with command Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <c-a> :Ag<cr>
nnoremap <c-s> :Tags<cr>

let g:LanguageClient_diagnosticsSignsMax=0
let g:LanguageClient_diagnosticsEnable=0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" begin
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <c-j>     <Plug>(neosnippet_expand_or_jump)
smap <c-j>     <Plug>(neosnippet_expand_or_jump)
xmap <c-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#disable_runtime_snippets = {'_' : 1}
" end

let g:neosnippet#snippets_directory = "~/.config/nvim/snippets"

xmap <c-c> <esc>
nnoremap g<C-G> gg=G''

nnor <leader>cf :let @*=expand("%:p")<CR>    " Mnemonic: Copy File path
nnoremap <c-q> <c-w>w




let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
