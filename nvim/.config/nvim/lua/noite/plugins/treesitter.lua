local setup = function()
  local treesitter = require('nvim-treesitter.configs')

  treesitter.setup({
    playground = { enable = true },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    ensure_installed = {
      "dockerfile",
      "hocon",
      "html",
      "java",
      "json",
      "lua",
      "markdown",
      "python",
      "scala",
      },
    highlight = {
      enable = true,
    },
  })
end

return {
  setup = setup,
}