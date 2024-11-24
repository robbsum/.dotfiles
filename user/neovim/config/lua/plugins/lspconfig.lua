return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Server configurations
        local servers = {
            nixd = {},
            gopls = {},
            lua_ls = {},
            pyright = {},
            rust_analyzer = {}
        }

        -- Setup servers
        for server_name in pairs(servers) do
            local server = servers[server_name]

            -- Override
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
                                                      server.capabilities or {})

            -- Setup server
            require("lspconfig")[server_name].setup(server)
        end
    end
}
