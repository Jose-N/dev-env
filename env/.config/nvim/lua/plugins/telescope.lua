return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>tf", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>td", builtin.diagnostics, { desc = "Telescope LSP diagnostics" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
