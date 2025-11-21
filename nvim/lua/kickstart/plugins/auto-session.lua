return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

			-- 1. Enable built-in Auto Save/Restore
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,

			-- 2. IMPORTANT: Session loading behavior
			-- false = Load the session for the current directory (Recommended)
			-- true  = Load the last session you used, regardless of where you are
			auto_session_enable_last_session = false,

			-- 3. Directories where session saving is disabled
			auto_session_suppress_dirs = { "~/", "/tmp", "/", vim.fn.expand("~") },
			auto_session_use_git_branch = false,

			-- 4. Close Neo-tree before saving to prevent UI glitches
			pre_save_cmds = {
				function()
					if vim.fn.exists(":Neotree") > 0 then
						vim.cmd("silent! Neotree close")
					end
				end,
			},

			-- 5. Re-open Neo-tree after loading the session
			post_restore_cmds = {
				function()
					-- Short delay to ensure the UI is ready
					vim.defer_fn(function()
						if vim.fn.exists(":Neotree") > 0 then
							vim.cmd("silent! Neotree show")
						end
					end, 100)
				end,
			},

			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			args_allow_single_directory = true,
		})
	end,
}
