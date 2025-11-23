return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Search for existing sessions using Telescope
		{
			"<leader>fs",
			function()
				vim.cmd("AutoSession search")
			end,
			desc = "[F]ind [S]ession",
		},
	},
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

			-- BEHAVIOR
			auto_session_enable_last_session = false,
			auto_create_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,

			-- SUPPRESSED DIRECTORIES
			auto_session_suppress_dirs = { "~/", "/tmp", "/", vim.fn.expand("~"), "~/Downloads", "~/Documents" },

			-- MINI.FILES CLEANUP
			close_unsupported_windows = true,
			pre_save_cmds = {
				function()
					local ok, MiniFiles = pcall(require, "mini.files")
					if ok and MiniFiles then
						MiniFiles.close()
					end
				end,
			},

			-- TELESCOPE INTEGRATION
			session_lens = {
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},

			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			args_allow_single_directory = true,
		})
	end,
}
