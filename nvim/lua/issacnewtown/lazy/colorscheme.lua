return {
    "rebelot/kanagawa.nvim",
    config = function ()
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
            theme = "dragon",
        })

        vim.cmd("colorscheme kanagawa-dragon")
    end
}
