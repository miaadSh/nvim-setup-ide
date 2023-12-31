local lint = require('lint')

lint.linters.cargo = {
	cmd = 'cargo check',
	stdin = true,
	args = {},
	stream = 'both',
	ignore_exitcode = false,
	env = nil,
}

lint.linters_by_ft = {
	go = {'golangcilint', 'revive'}
}

local golangcilint = require('lint.linters.golangcilint')

golangcilint.args = {
	 'run',
	 '--out-format',
	 'json',
 	}

 vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	 callback = function()
		 require('lint').try_lint()
	 end,
 })
