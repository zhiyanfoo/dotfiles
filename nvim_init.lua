vim.pack.add({
  'https://github.com/zenbro/mirror.vim',
  'https://github.com/rust-lang/rust.vim',
  'https://github.com/tpope/vim-commentary',
  'https://github.com/wesQ3/vim-windowswap',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/svermeulen/vim-easyclip',
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/vim-scripts/UnconditionalPaste',
  'https://github.com/terryma/vim-multiple-cursors',
  'https://github.com/chrisbra/Recover.vim',
  'https://github.com/junegunn/fzf',
  'https://github.com/junegunn/fzf.vim',
  'https://github.com/maxbrunsfeld/vim-emacs-bindings',
  'https://github.com/drmikehenry/vim-headerguard',
  'https://github.com/svermeulen/vimpeccable',
  'https://github.com/Shougo/ddc.vim',
  'https://github.com/vim-denops/denops.vim',
  'https://github.com/Shougo/ddc-nvim-lsp',
  'https://github.com/Shougo/ddc-source-around',
  'https://github.com/Shougo/ddc-matcher_head',
  'https://github.com/Shougo/ddc-sorter_rank',
  'https://github.com/Shougo/ddc-ui-native',
  -- 'https://github.com/github/copilot.vim',
})

-- OPTIONS
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cmdheight = 1
vim.opt.ruler = true
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildmenu = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.textwidth = 96
vim.opt.backspace = 'indent,eol,start'
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
vim.opt.undofile = true
vim.opt.scrolloff = 5
vim.opt.hidden = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- AUTOCOMMANDS
local augroup = vim.api.nvim_create_augroup('vimrc', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'crontab',
  command = 'setlocal nobackup nowritebackup',
})

vim.api.nvim_create_autocmd('CursorMovedI', {
  group = augroup,
  pattern = '*',
  command = "if pumvisible() == 0|silent! pclose|endif",
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = '*',
  command = "if pumvisible() == 0|silent! pclose|endif",
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  pattern = { '*.c', '*.cpp', '*.java', '*.php', '*.py', '*.js', '*.ts', '*.rkt' },
  command = [[%s/\s\+$//e]],
})

-- MAPPINGS
vim.g.mapleader = ','

local map = vim.keymap.set

map('n', '<S-U>', '<C-R>')

map('n', '<leader>el', ':edit ~/.config/nvim/lua/tools.lua<cr>')
map('n', '<leader>sv', ':source $MYVIMRC<cr>')
map('n', '<leader>evs', ':edit ~/.config/nvim/init.lua<cr>')

map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$h')

map('n', 'k', function() return vim.v.count == 0 and 'gk' or 'k' end, { expr = true })
map('n', 'j', function() return vim.v.count == 0 and 'gj' or 'j' end, { expr = true })

map('n', '<leader>nn', ':bnext<cr>')
map('n', '<leader>pp', ':bprevious<cr>')

map('n', '<leader>ht', 'ihttp://')

map('n', '<c-h>', ':TmuxNavigateLeft<cr>', { silent = true })
map('n', '<c-j>', ':TmuxNavigateDown<cr>', { silent = true })
map('n', '<c-k>', ':TmuxNavigateUp<cr>', { silent = true })
map('n', '<c-l>', ':TmuxNavigateRight<cr>', { silent = true })

map('n', '<leader>cdd', ':cd %:p:h<cr>')

map('v', '//', 'y/<C-R>"<CR>')

map('n', 'cp', '"_dwhp')

map('n', '<leader>hh', ':noh<cr>')

map('n', '<leader>sp', ':set spell spelllang=en<cr>')
map('n', '<leader>spn', ':set nospell<cr>')

map('n', '<c-p>', ':Files<cr>', { silent = true })
map('n', 'M', ':Buffers<cr>')

map('n', '<F5>', [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]], { silent = true })

map('n', 'q:', '<Nop>')
map('n', '<F1>', '<Nop>')

map('n', '<leader>gi', ':!goimports -w %:p<CR>')

map('n', '<leader>cc', ':cclose<CR>')

map('n', '<leader>cf', ':let @*=expand("%:p")<CR>')

map('x', '<c-c>', '<esc>')

vim.cmd([[imap <silent><script><expr> <C-I> copilot#Accept("\<CR>")]])

-- PLUGIN CONFIG
vim.g.rust_clip_command = 'pbcopy'
vim.g.rustfmt_autosave = 0
vim.g.fzf_layout = { down = '~40%' }

vim.cmd([[command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)]])
map('n', '<c-a>', ':Ag<cr>')

vim.cmd([[command! CopyFull let @+ = expand('%:p')]])
vim.cmd([[command! CopyPath let @+ = expand('%:.')]])
vim.cmd([[command! CP let @+ = expand('%:.')]])
vim.cmd([[command! CF let @+ = expand('%:p')]])
vim.cmd([[command! CL let @+ = expand('%:.') . ':' . line('.')]])

vim.cmd([[command! Scratch lua require'tools'.makeScratch()]])

vim.cmd([[
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
]])

-- ddc
vim.fn['ddc#custom#patch_global']('ui', 'native')
vim.fn['ddc#custom#patch_global']('sources', { 'around' })
vim.fn['ddc#custom#patch_global']('sourceOptions', {
  _ = {
    matchers = { 'matcher_head' },
    sorters = { 'sorter_rank' },
  },
})

vim.cmd([[
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB> pumvisible() ? '<C-p>' : '<C-h>'
]])

vim.fn['ddc#enable']()

-- Lua modules
require('startup')
require('tools')
