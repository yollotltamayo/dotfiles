local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }), -- change to your dialect
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.shfmt,
	},
})
