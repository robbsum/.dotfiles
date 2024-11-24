return {
    "NeogitOrg/neogit",
    dependencies = {"sindrets/diffview.nvim"},
    opts = {},
    keys = {
        {
            "<Up>",
            function() require("neogit").open() end,
            mode = "n",
            desc = "Open Neogit"
        }
    }
}
