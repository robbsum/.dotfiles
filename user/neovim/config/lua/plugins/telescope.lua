return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local builtin = require('telescope.builtin')

        -- Set keymaps
        vim.keymap.set('n', '<leader>tp', builtin.git_files,
                       {desc = 'Telescope find files'})

        vim.keymap.set('n', '<leader>tr', builtin.live_grep,
                       {desc = 'Telescope live grep'})
    end,
    dependencies = {"nvim-lua/plenary.nvim"}
}
