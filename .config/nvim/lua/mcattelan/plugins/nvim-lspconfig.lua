return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "j-hui/fidget.nvim", opts = {} },
  },
  opts = {
    diagnostics = {
      underline = false,
      virtual_text = false,
      float = { border = "rounded" },
      update_in_insert = false,
      severity_sort = true,
    },
    servers = {
      bashls = {},
      lua_ls = {},
    },
  },
  config = function(_, opts)
    local utils = require("mcattelan.utils")

    local function map_lsp_key(mode, key, command, event, description)
      utils.keymaps.map_key(mode, key, command, { buffer = event.buf, desc = "LSP: " .. description })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = utils.autocmds.nvim_create_augroup("lsp-attach"),
      callback = function(event)
        map_lsp_key("n", "gd", vim.lsp.buf.definition, event, "[G]oto [D]efinition")
        map_lsp_key("n", "gD", vim.lsp.buf.declaration, event, "[G]oto [D]eclaration")
        map_lsp_key("n", "gr", vim.lsp.buf.references, event, "[G]oto [R]eferences")
        map_lsp_key("n", "gI", vim.lsp.buf.implementation, event, "[G]oto [I]mplementation")
        map_lsp_key("n", "K", vim.lsp.buf.hover, event, "Hover Documentation")
        map_lsp_key("n", "gK", vim.lsp.buf.signature_help, event, "Signature Help")
        map_lsp_key("i", "<C-k>", vim.lsp.buf.signature_help, event, "Signature Help")
        map_lsp_key("n", "<leader>rn", vim.lsp.buf.rename, event, "[R]e[n]ame")
        map_lsp_key("n", "<leader>ca", vim.lsp.buf.code_action, event, "[C]ode [A]ction")
        map_lsp_key("n", "<leader>D", vim.lsp.buf.type_definition, event, "Type [D]efinition")
      end,
    })

    vim.diagnostic.config(opts.diagnostics)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
    require("lspconfig.ui.windows").default_options = { border = "rounded" }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local ensure_installed = vim.tbl_keys(opts.servers or {})
    vim.list_extend(ensure_installed, {
      "beautysh",
      "stylua",
    })

    local handlers = {
      function(server_name)
        local server = opts.servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        require("lspconfig")[server_name].setup(server)
      end,
    }

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({ handlers = handlers })
  end,
}
