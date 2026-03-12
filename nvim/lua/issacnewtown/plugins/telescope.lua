return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        -- {
        --     "echasnovski/mini.icons",
        --     opts = {
        --         style = 'glyph',
        --
        --         -- Customize per category. See `:h MiniIcons.config` for details.
        --         java = { glyph = 'J', hl = 'MiniIconsOrange' },
        --
        --
        --         -- Control which extensions will be considered during "file" resolution
        --         use_file_extension = function(ext, file) return true end,
        --     },
        --     lazy = true,
        --     specs = {
        --         { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        --     },
        --     init = function()
        --         package.preload["nvim-web-devicons"] = function()
        --             require("mini.icons").mock_nvim_web_devicons()
        --             return package.loaded["nvim-web-devicons"]
        --         end
        --     end,
        -- },
        -- "nvim-tree/nvim-web-devicons" 
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
        vim.keymap.set("n", "<C-f>", builtin.find_files)
        vim.keymap.set("n", "<leader>w", builtin.live_grep)
    end
}
