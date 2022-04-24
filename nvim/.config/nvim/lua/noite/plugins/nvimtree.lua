local setup = function()
  local nvimtree = require("nvim-tree")

  nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
  }
end

return {
  setup = setup,
}