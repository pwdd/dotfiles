local setup = function()
  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "nvim_lsp", priority = 10 },
      { name = "buffer" },
      { name = "vsnip" },
      { name = "path" },
    },
    snippet = {
      expand = function(args)
        -- Comes from vsnip
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
  })
end

return {
  setup = setup,
}