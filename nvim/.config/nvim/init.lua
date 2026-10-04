
-- Avvia treesitter solo se il parser esiste, altrimenti ignora
local ts_start = vim.treesitter.start
vim.treesitter.start = function(...)
  pcall(ts_start, ...)
end

-- Lazy
require("config.lazy")

-- Option (colorscheme, general / plugin keymaps)
require("config.options")

-- keymap
require("config.remap")

-- Load my custom commands
require("config.commands")

