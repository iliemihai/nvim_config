return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
    "tpope/vim-fugitive",
	},
	config = function()
    require("dapui").setup()
		require("dap-python").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dr", ":DapRestartFrame<CR>")
		vim.keymap.set("n", "<Leader>dt", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>ds", ":DapStepOver<CR>")
    vim.keymap.set("n", "<Leader>da", ":DapStepOut<CR>")
    vim.keymap.set("n", "<Leader>dd", ":DapStepInto<CR>")
	end,
}
