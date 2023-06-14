-- search file, hidden ones
vim.keymap.set('n', '<leader>ff' , ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
-- Live grep
vim.keymap.set('n', '<leader>fg' , ':lua require"telescope.builtin".live_grep()<CR>', {})
