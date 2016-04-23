" BASIC CONFIG
" -----------------------------------------------------------------
set nocompatible
filetype off                  
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

if has('gui_running')
    set background=light
    colorscheme solarized
else
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


"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

if exists("g:more_features_checker")
    Plugin 'Valloric/YouCompleteMe'
    " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
    " let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    " let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
    let g:ycm_key_list_select_completion   = ['<tab>', '<Down>']

    " Plugin 'ervandew/supertab'
    " let g:SuperTabDefaultCompletionType    = '<C-n>'
    " let g:SuperTabCrMapping                = 0

    Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<C-j>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    let g:UltiSnipsEditSplit="vertical"
endif

if has('gui_running')
    Plugin 'junegunn/goyo.vim'
endif

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-abolish'

Plugin 'wesQ3/vim-windowswap'

Plugin 'tpope/vim-repeat'

Plugin 'svermeulen/vim-easyclip'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'vim-scripts/UnconditionalPaste'

"keep window on buffer delete
Plugin 'kwbdi.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'suan/vim-instant-markdown'
"You first need to have node.js with npm installed.
"    [sudo] npm -g install instant-markdown-d

Plugin 'jamessan/vim-gnupg'

" gives you ability to diff swp files during recovery
Plugin 'chrisbra/Recover.vim'

Plugin 'jpalardy/vim-slime'

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

let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" MODES
" -----------------------------------------------------------------

func! WordProcessorMode() 
    setlocal spell spelllang=en_us 
    set vb t_vb=
endfu 
com! WP call WordProcessorMode()

" MAPPINGS
" -----------------------------------------------------------------


let mapleader = " "

" save
nnoremap <leader>w :w<cr>

nnoremap - O<esc>

"undo undo
nnoremap <S-U> <C-R>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap H ^
nnoremap L $

vnoremap H ^
vnoremap L $h

"move around line wrap without skipping lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

noremap <leader>n :bnext<cr>
noremap <leader>b :bprevious<cr>

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

nnoremap <leader>ft :CommandTFlush<CR>

nnoremap cp "_dwhp

nnoremap <leader>pi :PluginInstall<CR>

function! ToggleNumberMapping()
    let s:switch_number = exists('s:switch_number') ? !s:switch_number: 1
    if s:switch_number
       " echom 'switch'
       call SwitchMapping()
    else
       " echom 'invert'
       call InvertSwitchMapping()
    endif
endfunction

function! SwitchMapping()
    " echom 'called switch mapping'
    " map each number to its shift-key character
    noremap! 1 !
    noremap! 2 @
    noremap! 3 #
    noremap! 4 $
    noremap! 5 %
    noremap! 6 ^
    noremap! 7 &
    noremap! 8 *
    noremap! 9 (
    noremap! 0 )
    noremap! - _
    " and then the opposite
    noremap! ! 1
    noremap! @ 2
    noremap! # 3
    noremap! $ 4
    noremap! % 5
    noremap! ^ 6
    noremap! & 7
    noremap! * 8
    noremap! ( 9
    noremap! ) 0
    noremap! _ -
endfunction

function! InvertSwitchMapping()
    " echom 'called invert switch mapping'
    noremap! 1 1
    noremap! 2 2
    noremap! 3 3
    noremap! 4 4
    noremap! 5 5
    noremap! 6 6
    noremap! 7 7
    noremap! 8 8
    noremap! 9 9
    noremap! 0 0
    noremap! - -
    " and then the opposite
    noremap! ! !
    noremap! @ @
    noremap! # #
    noremap! $ $
    noremap! % %
    noremap! ^ ^
    noremap! & &
    noremap! * *
    noremap! ( (
    noremap! ) )
    noremap! _ _
endfunction
 
nnoremap <silent> <leader>a :call<space>ToggleNumberMapping()<cr>

" noremap! ; :
" noremap! : ;
noremap ; :
noremap : ;

" print variable name
nnoremap <leader>pn ^Vypiprint('<esc>$a')<esc>kdd

nnoremap <leader>pp ^Vypiprint(<esc>$a)<esc>kdd

nnoremap <leader>fd ^dwx$x

nnoremap <leader>" i""""""<esc>
