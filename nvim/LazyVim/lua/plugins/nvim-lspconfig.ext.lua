return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ts_ls = {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      vtsls = { enabled = false },
    },
    setup = {
      --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
      --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
      tsserver = function()
        -- disable tsserver
        return true
      end,
      vtsls = function(_, opts)
        return true
      end,
      ts_ls = function()
        LazyVim.lsp.on_attach(function(client, buffer) end, "ts_ls")
      end,
    },
  },
}
