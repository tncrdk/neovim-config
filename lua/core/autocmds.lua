-- Attach to lsp
vim.api.nvim_create_autocmd('LspAttach', {
  -- Create a group for lsp-attach autocmds
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  -- Callback
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Function for mappping keys
    local lsp_map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end

    -- Key-mappings
    lsp_map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    lsp_map("<leader>la", vim.lsp.buf.code_action, "Code action")
    lsp_map("<leader>ld", vim.lsp.buf.type_definition, "Type definition")
    lsp_map("<leader>ss", require("telescope.builtin").lsp_document_symbols, "Document symbols")

    lsp_map("gd", vim.lsp.buf.definition, "Goto Definition")
    lsp_map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    lsp_map("gr", require("telescope.builtin").lsp_references, "Goto References")
    lsp_map("gI", vim.lsp.buf.implementation, "Goto Implementation")
    lsp_map("gs", vim.lsp.buf.signature_help, "Signature Documentation") -- Ex: Checking arguments of function when supplying them

    -- Diagnostic keymaps
    lsp_map("gx", vim.diagnostic.open_float, "Show diagnostics under cursor")
    lsp_map("K", vim.lsp.buf.hover, "Hover Documentation")

    -- Trouble
    lsp_map("<leader>ls", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)")
    lsp_map("<leader>ll", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      "LSP References (Trouble)")


    -- Inlay hints
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      lsp_map('<leader>lh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Toggle Inlay Hints')
    end

    -- Attach and configure vim-illuminate
    require("illuminate").on_attach(client)

    if client and client.server_capabilities.documentSymbolProvider then
      -- Attach nvim-navic and nvim-navbuddy
      local navic = require('nvim-navic')
      local navbuddy = require("nvim-navbuddy")

      -- Check if we can connect, e.g. if we have connected before
      if navic.is_available(ev.buf) then
        navic.attach(client, ev.buf)

        navbuddy.attach(client, ev.buf)
        lsp_map("<leader>ln", "<cmd>Navbuddy<cr>", "NavBuddy")
      end
    end

    -- Enable comletion
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})


-- Set tabsize to 2 when working with R-files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "r",
  command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  command = "set formatoptions+=t"
})
