--- @class vim.lsp.Config
return {
	cmd = {
		"yaml-language-server",
		"--stdio",
	},
	filetypes = {
		"yaml",
		"yaml.docker-compose",
		"yaml.gitlab",
	},
	settings = {
		yaml = {
			kubernetesCRDStore = {
				enable = true,
			},
			schemas = {
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "api.yaml",
			},
		},
	},
}
