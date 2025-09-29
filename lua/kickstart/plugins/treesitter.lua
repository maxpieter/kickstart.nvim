return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "lua",
        "bash",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "typescript",
        "javascript",
        "html",
        "css",
        "graphql",
        "python",
        "go",
        "rust",
        "c",
        "cpp",
        "c_sharp",
        "java",
        "nix",
        "toml",
        "dockerfile",
        "latex",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}