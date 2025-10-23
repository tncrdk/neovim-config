--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "vscode-html-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "html", "templ" },
  root_markers = { "package.json", ".git" },
  settings = {},
}
