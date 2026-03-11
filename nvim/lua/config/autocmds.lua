-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ESLint auto-fix on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function(event)
    if #vim.lsp.get_clients({ bufnr = event.buf, name = "eslint" }) > 0 then
      local ff = vim.bo[event.buf].fileformat
      vim.api.nvim_buf_call(event.buf, function()
        vim.cmd("LspEslintFixAll")
      end)
      vim.bo[event.buf].fileformat = ff
    end
  end,
})

-- Autosave on leaving insert mode or changing text in normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
