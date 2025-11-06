return {
	"rmagatti/auto-session",
	event = "VimEnter",
	config = function()
		local autosession = require("auto-session")

		autosession.setup({
			log_level = "info",
			auto_session_enable_last_session = true, -- enable global last session fallback
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/" }, -- ignore home dir
			pre_save_cmds = { "lua vim.cmd(':wa')" }, -- save all buffers before saving session
			bypass_session_save_file_types = { "gitcommit", "fugitive" },
			session_lens_enable = true,
		})

		-- Automatically save session when exiting Neovim inside Tmux
		if os.getenv("TMUX") then
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					autosession.SaveSession()
				end,
			})
		end

		-- Automatically restore project session if exists, else fallback to last global session
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local cwd = vim.fn.getcwd()
				local project_session = autosession.SearchSession({ cwd = cwd })
				if project_session then
					autosession.RestoreSession({ session = project_session })
				elseif vim.o.sessionoptions:match("buffers") then
					-- fallback to last session globally
					autosession.RestoreSession()
				end
			end,
		})
	end,
}
