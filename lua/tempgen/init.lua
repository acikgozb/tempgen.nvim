local M = {}

local log = require("plenary.log").new({
	plugin = "tempgen",
	level = "info",
})

local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")
local telescope_actions_state = require("telescope.actions.state")
local telescope_utils = require("telescope.utils")
local config = {}

local function setTemplatePath(path)
	config.path = path
end

function M.setup(opts)
	if opts == nil or opts.path == nil then
		log.warn("User path for templates are not specified in config. Therefore, the plugin setup is skipped.")
		return
	end

	setTemplatePath(opts.path)
end

vim.api.nvim_create_user_command("Tempgen", function()
	print("exec tempgen")
end, {})

return M
