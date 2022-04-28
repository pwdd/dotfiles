
local setup = function()
  local trouble = require("trouble")

  local wk = require("which-key")

  wk.register({
      ["<leader>"] = {
        x = {
          name = "trouble",
          x = { 
            '<cmd>Trouble<cr>', 
            "workspace diagnostics",
          },
          w = { 
            '<cmd>Trouble workspace_diagnostics<cr>',
            "workspace diagnostics" 
          },
          d = { 
            '<cmd>Trouble document_diagnostics<cr>', 
            "document diagnostics" 
          },
          l = { 
            '<cmd>Trouble loclist<cr>', 
            'loclist'
          },  
          q = {
            '<cmd>Trouble quickfix<cr>',
            "quickfix"
          },
        },
        g = {
          name = "trouble",
          R = {
            '<cmd>Trouble lsp_references<cr>',
            "references"
          }
        }
      }
  })
end

return {
  setup = setup
}
