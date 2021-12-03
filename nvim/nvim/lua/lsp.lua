-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "rust_analyzer" then
    opts =  {
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
          cargo = {
            loadOutDirsFromCheck = true,
            target = "avr-unknown-gnu-atmega328"
          },

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
    }
  end
  -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
--local function setup_servers()
  --require'lspinstall'.setup()
  --local servers = require'lspinstall'.installed_servers()
  --for _, server in pairs(servers) do
    --require'lspconfig'[server].setup{
      --capabilities = capabilities,
    --}
  --end

  --local lsp_config = require'lspconfig'
  --local util = require'lspconfig'.util
  --lsp_config.sourcekit.setup {
    --cmd = { "xcrun", "sourcekit-lsp" },
    --root_dir = util.root_pattern("Package.swift", ".git"),
    ----filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc" }
    --filetypes = { "swift" }
  --}

  --lsp_config.clangd.setup {
    ----cmd = { "/usr/local/Cellar/llvm/12.0.1/bin/clangd", "-log=verbose" },
    ----cmd = { "xcrun", "clangd", "-log=verbose" },
    --cmd = { "xcrun", "clangd" },
    --root_dir = util.root_pattern("compile_commands.json"),
    --filetypes = { "c", "cpp", "objective-c", "objective-cpp", "objc" }
  --}

--lsp_config.rust_analyzer.setup({
    --on_attach=on_attach,
    --settings = {
      --["rust-analyzer"] = {
        ----trace = {
          ----server = "verbose"

        ----},
        --linkedProjects = {
          ----order is important (rust-analyzer/rust-analyzer#7764)
          --"Cargo.toml",
          ----"avr/Cargo.toml",
        --},
        --assist = {
          --importGranularity = "module",
          --importPrefix = "by_self",
        --},
        --cargo = {
          --loadOutDirsFromCheck = true,
          --target = "avr-unknown-gnu-atmega328"
        --},

        --diagnostics = {
          --disabled = {
            ----https://github.com/rust-analyzer/rust-analyzer/issues/6835
            --"unresolved-macro-call"
          --}
        --},
        --procMacro = {
          --enable = true
        --},
      --}
    --}
  --})


  --local opts = {
    --tools = { -- rust-tools options
      --autoSetHints = true,
      --hover_with_actions = true,
      --inlay_hints = {
        --show_parameter_hints = false,
        --parameter_hints_prefix = "",
        --other_hints_prefix = "",
      --},
    --},

    ---- all the opts to send to nvim-lspconfig
    ---- these override the defaults set by rust-tools.nvim
    ---- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    --server = {
      ---- on_attach is a callback called when the language server attachs to the buffer
      --on_attach = on_attach,
      --settings = {
        ---- to enable rust-analyzer settings visit:
        ---- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        --["rust-analyzer"] = {
            --assist = {
                --importGranularity = "module",
                --importPrefix = "by_self",
            --},
            --cargo = {
                --loadOutDirsFromCheck = true
            --},
            --procMacro = {
                --enable = true
            --},
          ---- enable clippy on save
          --checkOnSave = {
            --command = "clippy"
          --},
        --}
      --}
    --},
  --}

  --require('rust-tools').setup(opts)

  --lsp_config.rust.setup({
  --on_attach=on_attach,
  --settings = {
  --["rust-analyzer"] = {
  --assist = {
  --importGranularity = "module",
  --importPrefix = "by_self",
  --},
  --cargo = {
  --loadOutDirsFromCheck = true
  --},
  --procMacro = {
  --enable = true
  --},
  --}
--}
  --})
--end

--setup_servers()
---- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require'lspinstall'.post_install_hook = function ()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end

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
