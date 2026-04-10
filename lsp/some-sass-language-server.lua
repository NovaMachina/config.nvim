return {
	cmd = { "some-sass-language-server", "--stdio" },
	filetypes = { "scss" },
	root_markers = { "node_modules", ".git" },
	settings = {
		somesass = {
			workspace = {
				loadPaths = { "node_modules" },
			},
		},
	},
}
