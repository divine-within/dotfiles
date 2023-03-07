return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "rcarriga/nvim-dap-ui" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>dui", function()
				dap.continue()
			end)

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end)
			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end)

			local sign = vim.fn.sign_define

			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},

	{},

	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap_go = require("dap-go")

			dap_go.setup()

			vim.keymap.set("n", "<Leader>dt", function()
				dap_go.debug_test()
			end)
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap_python = require("dap-python")

			dap_python.setup()

			vim.keymap.set("n", "<Leader>ptm", function()
				dap_python.test_method()
			end)
			vim.keymap.set("n", "<Leader>ptc", function()
				dap_python.test_class()
			end)
			vim.keymap.set("n", "<Leader>pds", function()
				dap_python.debug_selection()
			end)
		end,
	},
}
