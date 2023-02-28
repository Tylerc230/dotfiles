-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lsp_installer = require("mason")
lsp_installer.setup()
require("mason-lspconfig").setup()
local lsp_config = require("lspconfig")


local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local function on_attach(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    map('n', '<leader>I', "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
  elseif client.resolved_capabilities.document_range_formatting then
    map('v', '<leader>i', "<cmd>lua vim.lsp.buf.range_formatting()<CR>", options)
    map('n', '<leader>i', "<cmd>lua vim.lsp.buf.range_formatting()<CR>", options)
  end
end


lsp_config.lua_ls.setup { on_attach = on_attach }
lsp_config.jdtls.setup { on_attach = on_attach }
--lsp_config.eslint.setup{} -- Needs newer node
lsp_config.tsserver.setup({
  experimental = {
    enableProjectDiagnostics = true
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)

  end,
})
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    --null_ls.builtins.diagnostics.tsc.with({
      --multiple_files = true
    --}),
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier
  },
  on_attach = on_attach
})

lsp_config.clangd.setup({
  --cmd = {"clangd", "-query-driver=/Users/cstyle/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++"},
  cmd = {"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd"},
  --root_dir = lsp_config.util.root_pattern("compile_commands.json"),
  filetypes = { "c", "cpp", "objective-c", "objective-cpp", "objc" },
  settings  = {
    --["clangd"] = {
      --query_driver = "/Users/cstyle/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++"
    --}
  }
})
lsp_config.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      --trace = {
      --server = "verbose"

      --},
      linkedProjects = {
        --order is important (rust-analyzer/rust-analyzer#7764)
        "Cargo.toml",
        --"avr/Cargo.toml",
      },
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      --cargo = {
      --loadOutDirsFromCheck = true,
      --target = "avr-unknown-gnu-atmega328"
      --},

      diagnostics = {
        disabled = {
          --https://github.com/rust-analyzer/rust-analyzer/issues/6835
          "unresolved-macro-call"
        }
      },
      procMacro = {
        enable = true
      },
    }
  }
})
local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        severity_sort = true
    }
)


local saga = require 'lspsaga'
saga.init_lsp_saga {
  code_action_prompt = {
    enable = false,
    sign = false,
  },
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = '<esc>',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = '<esc>',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
}
