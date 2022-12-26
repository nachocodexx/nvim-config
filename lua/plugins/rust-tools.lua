local rt = require("rust-tools")

rt.setup({
	tools = {
		autoSetHints = true,
		-- hover_with_actions = true,
		runnables = {use_telescope = true}
	},
	server = {
		n_attach = function(_, bufnr)
			-- Hover actionsvim
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groupsvim
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

		end                                                             

	}
})



