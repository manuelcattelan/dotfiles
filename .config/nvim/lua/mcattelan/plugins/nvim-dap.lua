return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  -- stylua: ignore
  keys = function()
    local dap = require("dap")
    local dapui = require("dapui")
    return {
      { "<leader>b", dap.toggle_breakpoint, desc = "Toggle [B]reakpoint" },
      { "<leader>gb", dap.run_to_cursor, desc = "[G]o To [B]reakpoint" },
      { "<leader>?", function() dapui.eval() end, desc = "Evaluate Symbol Under Cursor" },
      { "<leader>ds", dap.continue, desc = "[D]AP [S]tart" },
      { "<leader>dc", dap.step_over, desc = "[D]AP [C]ontinue" },
      { "<leader>do", dap.step_out, desc = "[D]AP Step [O]ut" },
      { "<leader>di", dap.step_into, desc = "[D]AP Step [I]nto" },
      { "<leader>dr", dap.restart, desc = "[D]AP [R]estart" },
      { "<leader>dt", dap.terminate, desc = "[D]AP [T]erminate" },
    }
  end,
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")
    dap_ui.setup()
    dap_virtual_text.setup({})

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    dap.adapters["node"] = function(callback, config)
      if config.type == "node" then
        config.type = "pwa-node"
      end

      local nativeAdapter = dap.adapters["pwa-node"]
      if type(nativeAdapter) == "function" then
        nativeAdapter(callback, config)
      else
        callback(nativeAdapter)
      end
    end

    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    ---@diagnostic disable-next-line: duplicate-set-field
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str, {}))
    end

    dap.listeners.before.attach.dapui_config = function()
      dap_ui.open()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dap_ui.close()
    end

    require("overseer").enable_dap()
  end,
}
