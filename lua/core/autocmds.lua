-- Attach to lsp
vim.api.nvim_create_autocmd('LspAttach', {
  -- Create a group for lsp-attach autocmds
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Function for mappping keys
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end

    -- Key-mappings
    map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>la", vim.lsp.buf.code_action, "Code action")
    map("<leader>ld", vim.lsp.buf.type_definition, "Type definition")
    map("<leader>ss", require("telescope.builtin").lsp_document_symbols, "Document symbols")

    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("gr", require("telescope.builtin").lsp_references, "Goto References")
    map("gI", vim.lsp.buf.implementation, "Goto Implementation")
    map("gs", vim.lsp.buf.signature_help, "Signature Documentation") -- Ex: Checking arguments of function when supplying them
    -- Diagnostic keymaps
    map("gx", vim.diagnostic.open_float, "Show diagnostics under cursor")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    -- Trouble
    -- TODO: Check if needed
    map("<leader>ls", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)")
    map("<leader>ll", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      "LSP Definitions / references / ... (Trouble)")

    -- nvim-navbuddy
    map("<leader>ln", "<cmd>Navbuddy<cr>", "NavBuddy")

    -- Inlay hints
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map('<leader>lh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Toggle Inlay Hints')
    end

    -- Attach and configure vim-illuminate
    require("illuminate").on_attach(client)

    -- Attach nvim-navic
    require("nvim-navic").attach(client, ev.buf)

    -- Enable comletion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})


-- Set tabsize to 2 when working with R-files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "r",
  command = "setlocal shiftwidth=2 tabstop=2"
})
