local setup = function()
  local nvimtree = require("nvim-tree")

  nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
  }

   require("which-key").register({
     ["<leader>"] = {
       n = {
         name = "+file",
         o = { "<cmd>NvimTreeToggle<cr>", "Toggle tree view" },
       },
     },
   })
end

return {
  setup = setup,
}
