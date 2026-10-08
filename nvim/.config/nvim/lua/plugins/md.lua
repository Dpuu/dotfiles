return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      heading = {
        enabled = true,
        icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
        backgrounds = {
          "#e83d84",
          "#d23678",
          "#c02c6c",
          "#aa2660",
          "#941f54",
          "#7e1948",
        },
        foreground = "#ffffff",
      },
      code = {
        enabled = true,
        border = "rounded",
      },
      bullet = {
        enabled = true,
        icons = { "•", "◦", "‣" },
      },
    },
  },
}
