local setup = function()
  local wk = require("which-key")
     wk.setup({
       key_labels = {
         ['<cr>'] = 'RET',
         ['<leader>'] = 'SPC',
         ['<space>'] = 'SPC',
         ['<tab>'] = 'TAB',
       },
       triggers = 'auto',
     })

     local leader = {
       w = {
         ['H'] = {'<C-W>5<', 'expand-window-left'},
         ['T'] = {
           function() vim.api.nvim_command('resize +5') end, 'expand-window-below',
         },
         ['N'] = {'<C-W>5>', 'expand-window-right'},
         ['C'] = {
           function() vim.api.nvim_command('resize -5') end, 'expand-window-up',
         },
         ['='] = {'<C-W>=', 'balance-window'},
         ['s'] = {'<C-W>s', 'split-window-below'},
         ['v'] = {'<C-W>v', 'split-window-right'},
       },
       p = {
         name = '+packer',
         c = {function() vim.api.nvim_command('PackerClean') end, 'Clean'},
         i = {function() vim.api.nvim_command('PackerInstall') end, 'Install'},
         r = {function() vim.api.nvim_command('PackerCompile') end, 'Compile'},
         s = {function() vim.api.nvim_command('PackerSync') end, 'Sync'},
       },
     }

     wk.register(leader, {prefix = '<leader>'})
   end
end

return {
  setup = setup,
}