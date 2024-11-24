return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "rust", "go", "python", "lua", "nix", "javascript",
                "typescript", "vue", "vim", "markdown", "json", "toml"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Highlighting
            highlight = {
                -- Enable highlighting
                enable = true
            }
        })
    end
}
