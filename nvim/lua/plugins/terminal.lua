return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
		})
		local opts = { silent = true }
		vim.keymap.set("n", "<leader>t", ":ToggleTermToggleAll<CR>", opts)
		vim.keymap.set("n", "<leader>;", ":ToggleTerm direction=vertical size=70<CR>", opts)
	end,
}
