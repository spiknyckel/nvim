local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    query = vim.fn.input("Grep > ")
    if query == "" then
        print("Empty query")
        return
    end
	builtin.grep_string({ search = query })
end)
