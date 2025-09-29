return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    ft = { "go", "gomod", "gosum", "gowork" },
    config = function()
      require("go").setup({})
    end,
  },
}