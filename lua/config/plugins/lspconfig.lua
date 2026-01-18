return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
  },
  opts = {
    servers = {
      ['*'] = {
        keys = {
          -- Add a keymap
          { "H", "<cmd>echo 'hello'<cr>", desc = "Say Hello" },
          -- Change an existing keymap
          { "K", "<cmd>echo 'custom hover'<cr>", desc = "Custom Hover" }
        },
      },
    },
  },
  config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
          setup_servers = {
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
          },
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
  end
}
