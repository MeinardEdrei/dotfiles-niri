return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true, -- This enables automatic restore!
			auto_create_enabled = true,
			auto_session_enable_last_session = true,
			auto_session_suppress_dirs = { "~/", "/tmp", "/", vim.fn.expand("~") },
			auto_session_use_git_branch = false,
			-- Automatically restore without asking
			auto_session_allowed_dirs = nil, -- Allow all dirs (except suppressed ones)
			-- Save all buffers before creating session
			pre_save_cmds = {
				function()
					-- Close neo-tree if open to avoid issues
					if vim.fn.exists(":Neotree") > 0 then
						vim.cmd("silent! Neotree close")
					end
				end,
			},
			-- Restore neo-tree after session loads
			post_restore_cmds = {
				function()
					-- Small delay to ensure buffers are loaded
					vim.defer_fn(function()
						if vim.fn.exists(":Neotree") > 0 then
							vim.cmd("silent! Neotree show")
						end
					end, 100)
				end,
			},
			-- Don't save these file types
			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			-- This is the key setting for automatic behavior!
			-- By default it will restore session for current directory
			-- If no session exists for current dir, it will use last session
			args_allow_single_directory = true,
		})
		-- Force save on ANY exit (even SIGTERM/SIGKILL where possible)
		vim.api.nvim_create_autocmd({ "VimLeavePre", "VimLeave" }, {
			callback = function()
				require("auto-session").SaveSession()
			end,
		})
	end,
}
