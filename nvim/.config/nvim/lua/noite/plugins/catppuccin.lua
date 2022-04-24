local setup = function()
  local catppuccin = require("catppuccin")

  catppuccin.setup {
    transparent_background = false,
    term_colors = false,
    styles = {
    	comments = "italic",
    	functions = "NONE",
    	keywords = "NONE",
    	strings = "NONE",
    	variables = "NONE",
    },
    integrations = {
    	treesitter = true,
    	native_lsp = {
    		enabled = true,
    		virtual_text = {
    			errors = "italic",
    			hints = "italic",
    			warnings = "italic",
    			information = "italic",
    		},
    		underlines = {
    			errors = "underline",
    			hints = "underline",
    			warnings = "underline",
    			information = "underline",
    		},
    	},
    	lsp_trouble = false,
    	cmp = true,
    	lsp_saga = false,
    	gitgutter = false,
    	gitsigns = false,
    	telescope = true,
    	nvimtree = {
    		enabled = false,
    		show_root = false,
    		transparent_panel = false,
    	},
    	neotree = {
    		enabled = false,
    		show_root = false,
    		transparent_panel = false,
    	},
    	which_key = false,
    	indent_blankline = {
    		enabled = true,
    		colored_indent_levels = false,
    	},
    	dashboard = true,
    	neogit = false,
    	vim_sneak = false,
    	fern = false,
    	barbar = false,
    	bufferline = true,
    	markdown = true,
    	lightspeed = false,
    	ts_rainbow = false,
    	hop = false,
    	notify = true,
    	telekasten = true,
    	symbols_outline = true,
    }
  }
end

return {
  setup = setup,
}