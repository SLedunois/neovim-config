return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					typescript = { { "prettierd", "prettier" } },
					javascript = { { "prettierd", "prettier" } },
					yaml = { "yamlfix" },
				},
				formatters = {
					yamlfix = {
						env = {
							YAMLFIX_WHITELINES = "1",
							YAMLFIX_SECTION_WHITELINES = "1",
							YAMLFIX_SEQUENCE_STYLE = "block_style",
						},
					},
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
