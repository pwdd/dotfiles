local setup = function()
  local lualine = require("lualine")

  lualine.setup {
    options = {
      icons_enabled = false,
      theme = 'catppuccin',
      component_separators = { left = ' ', right = ' '},
      section_separators = { left = ' ', right = ' '},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        'branch',
        'diff',
        {
          'diagnostics',
          sources = { 'nvim_diagnostic', 'coc' },
          diagnostics_color = {
            color_error = { fg = '#ec7279' },
            color_warn = { fg = '#ECBE7B' },
            color_info = { fg = '#a0c980' }
          }
        }
      },
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

return {
  setup = setup,
}