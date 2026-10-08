------------------------------------------------------------
-- 1. Indentation (correct deindent on \end{...})
------------------------------------------------------------
vim.opt_local.indentexpr = "VimtexIndentExpr()"
vim.opt_local.indentkeys:append("0=\\end")
vim.opt_local.smartindent = false -- avoid C‑style indent
vim.opt_local.autoindent = true
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

------------------------------------------------------------
-- 2. Hard wrapping at 96 chars
------------------------------------------------------------
-- Hard wrap at 96
vim.opt_local.textwidth = 96

-- Let Vim actually wrap text and lists
vim.opt_local.formatoptions:append("t")  -- auto-wrap text
vim.opt_local.formatoptions:append("n")  -- recognize lists
vim.opt_local.formatoptions:append("q")  -- gq formats comments/text
vim.opt_local.formatoptions:remove("l")  -- don't keep long lines
vim.opt_local.formatoptions:remove("r")  -- no auto comment on <CR>
vim.opt_local.formatoptions:remove("o")  -- no auto comment on 'o'

-- Use VimTeX's LaTeX-aware formatter (this is key)
vim.g.vimtex_format_enabled = 1
vim.opt_local.formatexpr = "vimtex#format#formatexpr()"


------------------------------------------------------------
-- 3. Disable LazyVim/Conform formatting for LaTeX
--    (otherwise gq does nothing)
------------------------------------------------------------
vim.g.vimtex_format_enabled = 1
vim.opt_local.formatexpr = "vimtex#format#formatexpr()"

------------------------------------------------------------
-- 4. Folding (VimTeX semantic folding)
------------------------------------------------------------
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
vim.opt_local.foldtext = "vimtex#fold#text()"
vim.opt_local.foldenable = true
vim.opt_local.foldlevel = 99

------------------------------------------------------------
-- 5. Comment color override (Treesitter + colorscheme safe)
------------------------------------------------------------
vim.api.nvim_set_hl(0, "Comment", { fg = "#6c7086", italic = true })
-- Example alternatives:
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#00d0ff", italic = true })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#ff66cc", italic = true })

------------------------------------------------------------
-- 6. Conceal settings (math looks clean)
------------------------------------------------------------
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "nc"

------------------------------------------------------------
-- 7. Spellcheck (English)
------------------------------------------------------------
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

------------------------------------------------------------
-- 8. Quality-of-life
------------------------------------------------------------
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "shift:2"
vim.opt_local.indentkeys:append("0=\\item")
vim.opt_local.indentkeys:append("0=\\item[")
vim.opt_local.showbreak = "↪ "
