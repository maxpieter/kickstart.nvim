return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      default = {
        img_dir = "img",
        affix = "[[${img_dir_rel}/${img_name}${ext}]]",
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("img-clip").paste_image()
        end,
        desc = "Paste image",
      },
    },
  },
  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}