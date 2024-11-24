return {
    "stevearc/oil.nvim",
    opts = {
        delete_to_trash = true,
        watch_for_changes = true,
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true
    },
    keys = {{"-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory"}}
}
