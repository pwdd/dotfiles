local f = require("noite.functions")
local trouble = require("trouble")
local map = f.map

local setup = function()
  require("which-key").register({
    ["<leader>"] = {
      f = {
        name = "telescope",
        f = { '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden = true })<CR>', "search files" }
      },
      l = {
        name = "telescope",
        g = { '<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>', "live grep" }
      },
      m = {
        name = "telescope",
        c = { '<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>', "metals commands" }
      },
      g = {
         name = "telescope",
         h = { '<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>' },
         d = {
           name = telescope,
           s = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]]', "document symbols" },
         },
         w = {
           name = telescope,
           s = { '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', "workspace symbols" },
         }
      },
      c = {
        name = telescope,
        c = { '<cmd>lua RELOAD("telescope").extensions.coursier.complete()<CR>', "coursier complete" },
      },
    }
  })

  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '-uu'
      },
      file_ignore_patterns = {
        ".git",
        ".idea",
        "target",
        "node_modules",
        "out",
        "%.min.js"
      },
      prompt_prefix = "❯",
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      mappings = {
        n = {
          ["f"] = actions.send_to_qflist,
        },
        i = { 
          ["<c-t>"] = trouble.open_with_trouble 
        },
        n = { 
          ["<c-t>"] = trouble.open_with_trouble 
        },
      },
    },
  })

  require("telescope").load_extension("fzy_native")
end

return {
  setup = setup,
}
