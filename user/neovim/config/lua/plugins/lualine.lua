return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                section_separators = {left = "", right = ""},
                component_separators = {left = "", right = ""}
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {{"branch", icon = ""}},
                lualine_c = {"diff"},
                lualine_x = {"diagnostics", "fileformat"},
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            tabline = {
                lualine_a = {{"buffers", symbols = {alternate_file = ""}}}
            }
        })
    end
}
