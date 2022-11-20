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
set clipboard+=unnamed


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

Plugin 'tpope/vim-commentary'
Plugin 'wesQ3/vim-windowswap'
" required from vim-easyclip
Plugin 'tpope/vim-repeat'
Plugin 'svermeulen/vim-easyclip'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/UnconditionalPaste'
" underline text for numpy doc for example
"keep window on buffer delete
Plugin 'kwbdi.vim'
Plugin 'terryma/vim-multiple-cursors'
" gives you ability to diff swp files during recovery
Plugin 'chrisbra/Recover.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'maxbrunsfeld/vim-emacs-bindings'

Plugin 'drmikehenry/vim-headerguard'
Plugin 'neovim/nvim-lspconfig'
Plugin 'svermeulen/vimpeccable'

Plugin 'Shougo/ddc.vim'
Plugin 'vim-denops/denops.vim'
Plugin 'Shougo/ddc-nvim-lsp'
Plugin 'Shougo/ddc-source-around'
Plugin 'Shougo/ddc-matcher_head'
Plugin 'Shougo/ddc-sorter_rank'
Plugin 'Shougo/ddc-ui-native'

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

" nnoremap <silent> <c-]> :call LanguageClient#textDocument_definition()<CR>
" " type info under cursor
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" " rename variable under cursor
" nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <silent> F :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> <leader>la :call LanguageClient#textDocument_codeAction()<CR>
" nnoremap <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>



" MAPPINGS
" -----------------------------------------------------------------

let mapleader = ","

let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 0
"undo undo
nnoremap <S-U> <C-R>

nnoremap <leader>el :edit ~/.config/nvim/lua/tools.lua<cr>
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
nnoremap M :Buffers<cr>
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

xmap <c-c> <esc>

nnor <leader>cf :let @*=expand("%:p")<CR>    " Mnemonic: Copy File path

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

nnoremap <leader>gi :!goimports -w %:p<CR>

" https://dev.to/pbnj/open-local-files-and-line-numbers-in-github-and-gitlab-26m6
function! GitBrowse(args) abort
    if a:args.filename ==# ''
        return
    endif
    let l:remote = trim(system('git config branch.'.a:args.branch.'.remote || echo "origin" '))
    if a:args.range == 0
        let l:cmd = 'git browse ' . l:remote . ' ' . a:args.filename
    else
        let l:cmd = 'git browse ' . l:remote . ' ' . a:args.filename . ' ' . a:args.line1 . ' ' . a:args.line2
    endif
    execute 'silent ! ' . l:cmd | redraw!
endfunction

command! -range GB call GitBrowse({
            \ 'branch': trim(system('git rev-parse --abbrev-ref HEAD 2>/dev/null')),
            \ 'filename': trim(system('git ls-files --full-name ' . expand('%'))),
            \ 'range': <range>,
            \ 'line1': <line1>,
            \ 'line2': <line2>,
            \ })
command! Scratch lua require'tools'.makeScratch()

lua require('startup')
lua require('tools')

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank']},
    \ })

    " \ 'nvim-lsp': {
    " \   'mark': 'lsp',
    " \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()
