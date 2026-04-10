return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		}

		lint.linters.eslint_d.parser = function(output, bufnr)
			local diagnostics = {}
			local ok, data = pcall(vim.json.decode, output)
			if not ok or not data then
				return diagnostics
			end

			for _, file in ipairs(data) do
				for _, msg in ipairs(file.messages or {}) do
					local message = msg.ruleId and (msg.message .. " [" .. msg.ruleId .. "]") or msg.message

					table.insert(diagnostics, {
						lnum = (msg.line or 1) - 1,
						col = (msg.column or 1) - 1,
						end_lnum = msg.endLine and (msg.endLine - 1) or nil,
						end_col = msg.endColumn and (msg.endColumn - 1) or nil,
						severity = msg.severity == 2 and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
						message = message,
						source = "eslint_d",
					})
				end
			end

			return diagnostics
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
