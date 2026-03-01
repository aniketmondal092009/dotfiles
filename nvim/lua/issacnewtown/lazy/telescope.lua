return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
	
	config = function()
        require("telescope").setup({
            defaults = {
                borderchars = { "", "", "", "", "", "", "", "" }
            }
        })
        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", builtin.find_files)
    end
}
