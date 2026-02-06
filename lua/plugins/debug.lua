return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html/modules/ps_mcp_server"] = "~/Work/ps_mcp_server/",
            ["/var/www/html"] = "~/Work/PrestaShop/",
          },
        },
        {
          type = "php",
          request = "launch",
          name = "Launch current file",
          program = "${file}",
          cwd = "${fileDirname}",
          port = 0,
          runtimeArgs = { "-dxdebug.start_with_request=yes" },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
      }
    end,
  },
}
