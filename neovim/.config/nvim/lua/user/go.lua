
local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

go.setup({
    build_tags="mock e2e",
    test_runner='richgo',
    run_in_floaterm=true,
    gofmt = 'gopls',
    goimport = 'gopls',
    dap_debug = true, -- set to false to disable dap,
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
  })
