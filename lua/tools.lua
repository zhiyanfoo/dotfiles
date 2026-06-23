local api = vim.api
local M = {}
function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  vim.bo[0].buftype="nofile" -- set the current buffer's (buffer 0) buftype to nofile
  vim.bo[0].bufhidden="hide"
  vim.bo[0].swapfile=false
end

function M.testPrint()
    print("test print")
end

M['unload_lua_namespace'] = function(prefix)
  local prefix_with_dot = prefix .. '.'
  for key, value in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end
end

local opts = { noremap=true, silent=true }

vim.keymap.set('n', 'gh', function() vim.cmd('e' .. "~/dotfiles/nvim-cheatsheet") end, opts)

-- lsp recommendation
-- https://github.com/neovim/nvim-lspconfig#Suggested-configuration
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<s-.>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format {async = true} end, bufopts)
end

vim.lsp.config('*', { on_attach = on_attach })

if vim.fn.executable('gopls') == 1 then
  vim.lsp.config('gopls', { cmd = { 'gopls', '--remote=auto' } })
  vim.lsp.enable('gopls')
end

if vim.fn.executable('rustup') == 1 then
  vim.lsp.config('rust_analyzer', { cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' } })
  vim.lsp.enable('rust_analyzer')
end

if vim.fn.executable('ty') == 1 then
  vim.lsp.enable('ty')
end


-- lspconfig. {
--     cmd = { },
--     on_attach = on_attach,
-- }

function _G.toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

vim.keymap.set('n', '<leader>tt', _G.toggle_diagnostics, {noremap = true, silent = true, desc = 'Toggle diagnostics'})

return M
