return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            go = {"goimports", "gofmt"},
            rust = {"rustfmt", lsp_format = "fallback"},
            python = {"ruff_format"}
        }
    },
    keys = {
        {
            "<leader>ff",
            function() require("conform").format({async = true}) end,
            mode = "n",
            desc = "Format current buffer"
        }
    }
}
