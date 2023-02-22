setlocal noexpandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap ,gi :!goimports -w %:p<CR>
