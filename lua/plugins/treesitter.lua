require("nvim-treesitter.configs").setup({
	autoinstall = true,
	sync_install = false,	
	ensure_installed = {"rust","lua","bash","python"},
	highlight = {
	  enable = true
	},
	indent = {enable  = true},
	incremental_selection = {enable = true},
	rainbow = {enable = true, },
	refactor = {
		highlight_definitions = {
			enable = false,
		},
		highlight_current_scope = {enable = false},
		smart_rename = {
			enable = true,
			keymaps = {smart_rename = "grr"}
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>"

			}
		}
	}
})
