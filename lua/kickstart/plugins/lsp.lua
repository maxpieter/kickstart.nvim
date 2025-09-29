return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- core language servers
        "lua_ls",
        "bashls",
        "jsonls",
        "yamlls",
        "marksman",
        "tsserver",
        "cssls",
        "html",
        "eslint",
        "tailwindcss",
        "graphql",
        "pyright",
        "gopls",
        "rust_analyzer",
        "clangd",
        "csharp_ls",
        "jdtls",
        "nil_ls",
        "dockerls",
        "docker_compose_language_service",
        "taplo",
        "texlab",
        "ltex",
        "stylelint_lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      -- capabilities for nvim-cmp
      local capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig.util.default_config.capabilities or {},
        cmp_nvim_lsp.default_capabilities()
      )

      -- helper function to setup servers
      local function setup(server, opts)
        opts = opts or {}
        opts.capabilities = capabilities
        lspconfig[server].setup(opts)
      end

      -- Lua: recognize the global `vim`
      setup("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- JSON: use schemastore for JSON schemas
      setup("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- YAML: use schemastore for YAML schemas
      setup("yamlls", {
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
            keyOrdering = false,
          },
        },
      })

      -- ESLint: disable formatting to prefer conform.nvim
      setup("eslint", {
        settings = {
          format = false,
        },
      })

      -- TailwindCSS
      setup("tailwindcss")

      -- GraphQL
      setup("graphql")

      -- Bash
      setup("bashls")

      -- Markdown
      setup("marksman")

      -- Python
      setup("pyright")

      -- Go
      setup("gopls")

      -- Rust
      setup("rust_analyzer")

      -- C/C++
      setup("clangd")

      -- C#
      setup("csharp_ls")

      -- Java: jdtls will be started by the java plugin

      -- Nix
      setup("nil_ls")

      -- Docker
      setup("dockerls")
      setup("docker_compose_language_service")

      -- TOML
      setup("taplo")

      -- LaTeX
      setup("texlab")

      -- LTeX (grammar/spell check)
      setup("ltex")

      -- Stylelint for CSS/SCSS/LESS
      setup("stylelint_lsp")

      -- Default servers for HTML, CSS, TypeScript/JavaScript
      setup("html")
      setup("cssls")
      setup("tsserver")
    end,
  },
}