local function nearest_diagnostic()
	local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	-- Filter and sort errors by proximity to the current line
	if #diagnostics > 0 then
		table.sort(diagnostics, function(a, b)
			local current_line = vim.fn.line(".")
			-- Sort by the absolute difference in line numbers
			return math.abs(a.lnum - current_line) < math.abs(b.lnum - current_line)
		end)
		local nearest = diagnostics[1]
		local line_num = nearest.lnum + 1 -- Diagnostics are 0-indexed
		local current_line = vim.fn.line(".")

		-- Only display if the nearest error is not on the current line
		if line_num ~= current_line then
			-- Use the error icon () and display the line number
			return " " .. line_num
		end
	end

	-- Check for nearest warning if no error is found
	local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	if #warnings > 0 then
		table.sort(warnings, function(a, b)
			local current_line = vim.fn.line(".")
			return math.abs(a.lnum - current_line) < math.abs(b.lnum - current_line)
		end)

		local nearest = warnings[1]
		local line_num = nearest.lnum + 1
		local current_line = vim.fn.line(".")

		if line_num ~= current_line then
			-- Use the warning icon () and display the line number
			return " " .. line_num
		end
	end
	return "" -- Return empty string if no relevant diagnostic is found
end

-- ----------------------------------------------------------------------
-- LUALINE PLUGIN CONFIGURATION
-- ----------------------------------------------------------------------

return { -- Lualine
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "catppuccin",
			section_separators = "",
			component_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch", -- Git branch info
				{
					"diagnostics",
					sources = { "nvim_lsp", "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					colored = true,
					always_visible = true,
				},
			},
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = {
				"encoding",
				"fileformat",
				"filetype",
				nearest_diagnostic,
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
