local dap = require('dap');
dap.adapters.node = {
    type = "executable",
    name = "node-debug",
    command = "node",
    args= {"~/tools/vscode-js-debug/src/debugServerMain.ts", "45635" }
}
--https://github.com/mfussenegger/nvim-dap/issues/82
dap.configurations.javascript = {
    {
	type = "node",
	request = "attach",
	name = "Attach to React Native",
	program = "${file}",
	programe = vim.api.nvim_eval("expand('%:p')"),
	debugServer = 45635,
	port = 45635,
	protocol = 'inspector',
	stopOnEntry = false,
	args = {},
	waitFor= true,
	runInTerminal = false,
    }
}

dap.configurations.typescriptreact = dap.configurations.javascript
