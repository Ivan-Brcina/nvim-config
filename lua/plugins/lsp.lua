return {
	{ "williamboman/mason.nvim", config = true },
	{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			opts = {
				ensure_installed = { "clangd" },
			},
	},
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			vim.lsp.config('clangd', {
				capabilities = require('blink.cmp').get_lsp_capabilities(),
			})
			vim.lsp.enable("clangd")
		end,
  },
}
