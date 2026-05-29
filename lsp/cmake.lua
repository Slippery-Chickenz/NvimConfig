return {
	cmd = { "cmake-language-server.exe" },
	filetypes = {
		"cmake",
		"CMakeLists.txt"
	},
	root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
