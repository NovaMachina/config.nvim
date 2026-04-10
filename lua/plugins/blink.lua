return {
	"saghen/blink.cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	version = "*",
	opts = {
		fuzzy = {
			implementation = "lua", -- Rust is breaking
		},
		snippets = { preset = "luasnip" },
		signature = {},
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "select_and_accept" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-d>"] = { "scroll_documentation_up", "fallback" },
			["<C-u>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		cmdline = {
			keymap = {
				["<C-e>"] = { "select_and_accept" },
			},
			completion = {
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
					end,
				},
			},
		},
		sources = {
			default = function()
				-- if vim.bo.filetype == "sql" then
				-- 	return { "dadbod" }
				-- end
				return {
					"snippets",
					"lsp",
					"path",
					"buffer",
				}
			end,
			providers = {
				-- dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				lsp = {
					score_offset = 3,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
