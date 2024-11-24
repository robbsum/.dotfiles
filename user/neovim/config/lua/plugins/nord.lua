return {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
        -- Nord config
        vim.g.nord_bold = false
        vim.g.nord_italic = false
        vim.g.nord_borders = false
        vim.g.nord_contrast = true
        vim.g.nord_disable_background = true
        vim.g.nord_uniform_diff_background = true

        -- Load the colorscheme
        require('nord').set()
    end
}
