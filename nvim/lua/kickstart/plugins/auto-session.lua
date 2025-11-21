return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

			-- 1. CRITICAL FIX: Stop loading random old sessions
			-- false = If I am in a new folder, start fresh/empty.
			-- true  = If I am in a new folder, load the last project I touched.
			auto_session_enable_last_session = false,

			-- 2. Create sessions for new folders automatically on exit
			auto_create_enabled = true,

			-- 3. Standard Save/Restore
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,

			-- 4. Directories to Ignore
			-- (Sessions won't save/load if you are in these specific folders)
			auto_session_suppress_dirs = { "~/", "/tmp", "/", vim.fn.expand("~") },

			auto_session_use_git_branch = false,

			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			args_allow_single_directory = true,
		})
	end,
}
