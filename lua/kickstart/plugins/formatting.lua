return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        vue = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        ["javascript.jsx"] = { "prettier" },
        ["typescript.tsx"] = { "prettier" },
        python = { "isort", "black" },
        lua = { "stylua" },
        nix = { "alejandra" },
        toml = { "taplo" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        sh = { "shfmt" },
        tex = { "latexindent" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}