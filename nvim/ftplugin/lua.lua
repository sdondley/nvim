local opts = { noremap=true, silent=true }
vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)

