local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engineexpand
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.                                                                                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,                                                                                                                                      },
	window = {
		       completion = cmp.config.window.bordered(),
		       documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		-- ________________________________________________
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
		{ name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        	{ name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer', keyword_length = 2 },        -- source current cmp-buffer
                { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
                { name = 'calc'},
        },
        {
                { name = 'buffer' },
	})
})
