return {
  -- LaTeX engine: VimTeX
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- General
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_quickfix_mode = 0

      -- Use project root
      vim.g.vimtex_root_markers = { ".git", "main.tex", "thesis.tex" }
    end,
  },

  -- LSP: TexLab
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
                forwardSearchAfter = true,
              },
              forwardSearch = {
                executable = "skim",
                args = { "%p", "%l", "%f" },
              },
              bibtexFormatter = "texlab",
              chktex = {
                onOpenAndSave = true,
                onEdit = false,
              },
            },
          },
        },
      },
    },
  },

  -- Completion: add VimTeX source to nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "vimtex" })
      return opts
    end,
  },

  -- Completion source for VimTeX
  {
    "hrsh7th/cmp-nvim-lsp",
    optional = true,
  },
}
