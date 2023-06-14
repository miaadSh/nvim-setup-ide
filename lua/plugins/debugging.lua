-- fetch the dap plugin
local dap = require('dap')

-- setup DapUI
local dapui = require('dapui')
local nvimtree = require('nvim-tree')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
	nvimtree.toggle()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	nvimtree.toggle()
	dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
	nvimtree.toggle()
	dapui.close()
end

-- Add adapter to codelldb
dap.adapters.codelldb = {
	type = 'server',
	host = '127.0.0.1',
	port = 13000
}

dap.configurations.c = {
	{
	type = 'codelldb',
	request = 'launch',
	program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
	end,
	cwd = '${workspaceFolder}',
	terminal = 'integrated'
	}
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = {
	{
	type = 'codelldb',
	request = 'launch',
	program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
	end,
	cwd = '${workspaceFolder}',
	terminal = 'integrated',
	sourceLanguages = { 'rust' }
	}
}

dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
		command = 'dlv',
		args = {'dap', '-l', '127.0.0.1:${port}'},
	},
}

dap.configurations.go = {
	{
		type = 'delve',
		name = 'Debug',
		request = 'launch',
		program  = "${file}",
	},
	{
		type = 'delve',
		name = 'Debug Tests',
		request = "launch",
		mode = 'test',
		program = "${file}",
	},
	{
    		type = "delve",
    		name = "Debug test (go.mod)",
    		request = "launch",
    		mode = "test",
    		program = "./${relativeFileDirname}"
  	} 
}
