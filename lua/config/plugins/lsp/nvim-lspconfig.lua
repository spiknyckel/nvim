local lspconfig = require("lspconfig")

local mason_lspconfig = require("mason-lspconfig")

local server_names = require("config").lsp_servers

local setup_servers_a = {
    "lua_ls",
    "rust_analyzer",
    "jedi_language_server",
    "qmlls",
    "zls",
    "hls",
    "java_language_server",
    "metals",
    "gopls",
    "templ",
}

local ensure_installed_a = {
    'ts_ls',
    'eslint',
    'rust_analyzer',
}

mason_lspconfig.setup({
    ensure_installed = ensure_installed_a,
    setup_servers = setup_servers_a,
    handlers = {
        function(server_name)
            if server_name == "lua_ls" then
                lspconfig["sumneko_lua"].setup(opts)
            else
                lspconfig[server_name].setup(opts)
            end
        end,
    },
})
