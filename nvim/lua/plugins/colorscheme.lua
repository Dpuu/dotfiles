return {
  -- add gruvbox
  { "datasektionen/dsekt.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dsekt",
    },
  },
}
