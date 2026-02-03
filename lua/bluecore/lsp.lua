local function set_keymaps()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
    -- Code actions, excluding generate actions
    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action({
            context = {
                only = {
                    "quickfix",
                    "refactor",
                }
            },
            apply = true,
        })
    end, opts)
    vim.keymap.set("n", "<leader>vsca", function()
        local new_search_term = vim.fn.input("Search code action: ")
        if new_search_term ~= "" then
            search_term = new_search_term
        end
        vim.lsp.buf.code_action({
            filter = function(ca)
                for term in search_term:gmatch("[^%s]+") do
                    if ca.title:match(term) ~= nil then
                        return true
                    end
                end
                return false
            end
        })
    end, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

set_keymaps()

vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable vim.lsp.completion',
  callback = function(event)
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local client_id = vim.tbl_get(event, 'data', 'client_id')
        if client_id == nil then
            return
        end
        set_keymaps()
    end,
})


vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("jdtls")
vim.lsp.enable("jedi_language_server")
