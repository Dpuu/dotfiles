-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.maplocalleader = "\\"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.keymap.set("n", "<localleader>t", ":VimtexTocToggle<CR>", { buffer = true })
    vim.keymap.set("n", "<localleader>m", ":VimtexImapsList<CR>", { buffer = true })
    vim.keymap.set("n", "<localleader>s", ":VimtexStatus<CR>", { buffer = true })
  end,
})

vim.keymap.set("n", "<localleader>C", ":%y+<CR>", { desc = "Copy entire buffer to clipboard" })
-- Trim trailing whitespace

-- Insert date
vim.keymap.set("n", "<localleader>td", function()
  local date = os.date("%Y-%m-%d")
  vim.api.nvim_put({ date }, "c", true, true)
end, { desc = "Insert date" })
