
return {
    -- minintro.nvim
    {
        "eoh-bse/minintro.nvim",
        lazy = false,
        config = true,
    },

    -- bufferline.nvim
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    always_show_bufferline = false
                }
            })
        end,
    },
}
