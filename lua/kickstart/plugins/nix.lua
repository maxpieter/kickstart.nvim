return {
  {
    "LnL7/vim-nix",
    ft = { "nix" },
  },
  {
    "direnv/direnv.vim",
    init = function()
      vim.g.direnv_update_on_buf_enter = 1
    end,
  },
}