-- Avvia treesitter solo se il parser esiste, altrimenti ignora
local ts_start = vim.treesitter.start
vim.treesitter.start = function(...)
  pcall(ts_start, ...)
end

-- LF su Linux/macOS, CRLF su Windows
local ff = vim.fn.has("win32") == 1 and "dos" or "unix"

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.bo.modifiable then
      vim.bo.fileformat = ff
    end
  end,
})
