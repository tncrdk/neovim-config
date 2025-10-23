--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  init_options = {
    provideFormatter = true
  },
  root_markers = { "package.json", ".git" },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
}
