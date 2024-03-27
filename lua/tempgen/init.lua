local M = {}

local log = require("tempgen.log")

function M.setup(opts)
	if opts == nil or opts.path == nil then
		log.warn("User path for templates are not specified in config. Therefore, the plugin setup is skipped.") -- log warning to user.
		return
	end

	print(opts.path)
end

return M
