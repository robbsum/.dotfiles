return {
    "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            -- Set up nvim-cmp
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort()
                }),
                sources = cmp.config.sources({
                    {name = "buffer"}, {name = "nvim_lsp"}, {name = "path"}
                })
            })
        end
    }
}
