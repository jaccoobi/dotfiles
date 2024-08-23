return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
  config = function ()
    vim.keymap.set("n", "<A-a>", ":lua require('harpoon.mark').add_file()<CR>")
    vim.keymap.set("n", "<A-l>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

    vim.keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
    vim.keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
    vim.keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
    vim.keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")

    vim.keymap.set("n", "<A-n>", ":lua require('harpoon.ui').nav_next()<CR>")
    vim.keymap.set("n", "<A-p>", ":lua require('harpoon.ui').nav_prev()<CR>")
  end
}
