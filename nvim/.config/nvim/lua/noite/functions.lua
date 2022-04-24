local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function split_on(s, delimiter)
  local result = {}
  local from = 1
  local delim_from, delim_to = string.find(s, delimiter, from)
  while delim_from do
    table.insert(result, string.sub(s, from, delim_from - 1))
    from = delim_to + 1
    delim_from, delim_to = string.find(s, delimiter, from)
  end
  table.insert(result, string.sub(s, from))
  return result
end

local function match_trailing_whitespace()
  local command = string.format([[match %s /\s\+$/]], "DiffDelete")
    vim.cmd(command)
end

local function trim_whitespaces()
  vim.cmd [[%substitute/\v\s+$//g]]
end

return {
  map = map,
  split_on = split_on,
  match_trailing_whitespace = match_trailing_whitespace,
  trim_whitespaces = trim_whitespaces,
}
