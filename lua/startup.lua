require'vimp'
local reload = function()
  -- Remove all previously added vimpeccable maps
  -- vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("tools").unload_lua_namespace('tools')
  -- -- Make sure all open buffers are saved
  -- vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  
  dofile(vim.fn.stdpath('config') .. '/lua/tools.lua')
  print("Reloaded vimrc!")
end

vimp.nnoremap('<leader>r', reload)
