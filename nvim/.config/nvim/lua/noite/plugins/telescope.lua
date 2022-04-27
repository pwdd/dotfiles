local f = require("noite.functions")
local map = f.map

local setup = function()
  require("which-key").register({
    ["<leader>"] = {
      f = {
        name = "+file",
        f = { '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden = true })<CR>', "search files" }
      },
      l = {
        name = "+file",
        g = { '<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>', "live grep" }
      },
      m = {
        name ="actions",
        c = { '<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>', "metals commands" }
      },

    }
  })
  map("n", "<leader>gh", [[<cmd>lua require("telescope.builtin").git_commits({layout_strategy="vertical"})<CR>]])
  map("n", "<leader>cc", [[<cmd>lua RELOAD("telescope").extensions.coursier.complete()<CR>]])

  map("n", "gds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
  map("n", "gws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])

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
      },
    },
  })

  require("telescope").load_extension("fzy_native")
end

return {
  setup = setup,
}
