local function require_ok(module)
	local ok, err = pcall(require, module)
	if not ok then
		vim.notify("Failed to load " .. module .. ": " .. tostring(err), vim.log.levels.ERROR)
	end
	return ok
end

require_ok("config.options")
require_ok("config.plugins")
require_ok("config.highlighting")
require_ok("config.theming")
require_ok("config.completion")
require_ok("config.diagnostics")
require_ok("config.languages")
require_ok("config.formatting")
require_ok("config.keymaps")
