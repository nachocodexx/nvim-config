local configs = require("lspconfig")

configs["pyright"].setup({
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = {"python"},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true
			}
		}
	},
	single_file_support = true
})

