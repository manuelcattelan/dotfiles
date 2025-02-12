-- Highlight text after yanking.
--   See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text after yanking",
  group = vim.api.nvim_create_augroup("highlight-text-after-yank", {}),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Enable format on save through Conform.
--   See https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Setup LSP keymaps.
--  See `:help vim.lsp.buf.*`
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Format current buffer on save",
  group = vim.api.nvim_create_augroup("lsp-keymaps", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = args.buf

      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Faster diagnostics navigation by specifying the preferred diagnostic
    -- direction and severity to filter the current buffer's diagnostics.
    local goto_diagnostic = function(diagnostic_direction, diagnostic_severity)
      local count = diagnostic_direction == "next" and 1 or -1
      local severity = diagnostic_severity and vim.diagnostic.severity[diagnostic_severity] or nil

      return function()
        vim.diagnostic.jump({ count = count, float = true, severity = severity })
      end
    end

    -- Open float window that shows the current line's diagnostic error, if present.
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

    -- Navigate current buffer's diagnostics with custom direction and filter options.
    vim.keymap.set("n", "[d", goto_diagnostic("prev"))
    vim.keymap.set("n", "]d", goto_diagnostic("next"))
    vim.keymap.set("n", "[w", goto_diagnostic("prev", "WARN"))
    vim.keymap.set("n", "]w", goto_diagnostic("next", "WARN"))
    vim.keymap.set("n", "[e", goto_diagnostic("prev", "ERROR"))
    vim.keymap.set("n", "]e", goto_diagnostic("next", "ERROR"))

    -- Default LSP capabilities' keymaps.
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "K", function()
      vim.lsp.buf.hover({ border = "single" })
    end)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
  end,
})
