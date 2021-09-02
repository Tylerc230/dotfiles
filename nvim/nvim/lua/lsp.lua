-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      --capabilities = capabilities,
    }
  end
end

setup_servers()
local lsp_config = require'lspconfig'
local util = require'lspconfig'.util
lsp_config.sourcekit.setup {
  cmd = { "xcrun", "sourcekit-lsp" },
  root_dir = util.root_pattern("Package.swift", ".git"),
  --filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc" }
  filetypes = { "swift" }
}

lsp_config.clangd.setup {
  --cmd = { "/usr/local/Cellar/llvm/12.0.1/bin/clangd", "-log=verbose" },
  --cmd = { "xcrun", "clangd", "-log=verbose" },
  cmd = { "xcrun", "clangd" },
  root_dir = util.root_pattern("compile_commands.json", ".git"),
  filetypes = { "c", "cpp", "objective-c", "objective-cpp", "objc" }
}
lsp_config.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
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
