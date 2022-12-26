local tokyonight = require("tokyonight")


tokyonight.setup({
	style = "storm",
	transparent = true,
	terminal_colors = true,
	styles = {comments = {italic = false}, keywords = {italic = false }},
	lualine_bold = true,	


})


vim.cmd[[colorscheme tokyonight]]
