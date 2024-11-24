return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            scope = {
                enabled = true,
                show_end = false,
                show_start = false,
                show_exact_scope = true
            }
        })
    end
}
