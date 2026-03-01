return {
    {
        'huyvohcmc/atlas.vim',
        lazy = false,
        priority = 1000,
        config = function()
        end
    },


    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = true,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })

        end,
    },

    {
        "rebelot/kanagawa.nvim",
        config = function ()
            -- Default options:
            require('kanagawa').setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "dragon",              -- Load "wave" theme
            })

            vim.cmd("colorscheme kanagawa-dragon")
        end
    }

}
