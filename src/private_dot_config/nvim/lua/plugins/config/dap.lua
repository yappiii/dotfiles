require("dap").configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    }
}
require("dap").adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end
vim.api.nvim_set_keymap("n", "5", ":lua require('dap').continue()<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "6", ":lua require('dap').step_over()<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "7", ":lua require('dap').step_into()<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "8", ":lua require('dap').step_out()<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
