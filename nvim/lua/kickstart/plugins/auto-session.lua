return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Save session when any file is written (Silent)",
			callback = function()
				vim.cmd("silent! SaveSession")
			end,
		})

		require("auto-session").setup({
			log_level = "error",
			auto_session_root_dir = vim.fn.expand("~/dotfiles-niri") .. "/nvim-sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_create_enabled = true,
			auto_session_enable_last_session = true,
			auto_session_suppress_dirs = { "~/", "/tmp", "/", vim.fn.expand("~") },
			auto_session_use_git_branch = false,
			auto_session_allowed_dirs = nil,

			-- Save all buffers before creating session
			pre_save_cmds = {
				function()
					if vim.fn.exists(":Neotree") > 0 then
						vim.cmd("silent! Neotree close")
					end
				end,
			},
			-- Restore neo-tree after session loads
			post_restore_cmds = {
				function()
					vim.defer_fn(function()
						if vim.fn.exists(":Neotree") > 0 then
							vim.cmd("silent! Neotree show")
						end
					end, 100)
				end,
			},
			-- Don't save these file types
			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			args_allow_single_directory = true,
		})

		vim.api.nvim_create_autocmd({ "VimLeavePre", "VimLeave" }, {
			callback = function()
				vim.cmd("silent! SaveSession")
			end,
		})
	end,
}
