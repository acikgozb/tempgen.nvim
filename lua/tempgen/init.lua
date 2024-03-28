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
	local trailing_slash = string.sub(path, #path)
	if trailing_slash == "/" or trailing_slash == "\\" then
		path = string.sub(path, 1, #path - 1)
	end

	config.path = telescope_utils.path_expand(path)
end

local function setUserCommand()
	local copy_template = function(prompt_bufnr)
		local selected_entry = telescope_actions_state.get_selected_entry()
		local selected_file = selected_entry[1]

		telescope_actions.close(prompt_bufnr)

		local template_path = config.path .. "/" .. selected_file
		local buffer_path = vim.api.nvim_buf_get_name(0)

		vim.system({ "cp", template_path, buffer_path }):wait()
		vim.cmd("e!")
	end

	vim.api.nvim_create_user_command("Tempgen", function()
		local filetype = vim.bo.filetype

		telescope_builtin.find_files({
			cwd = config.path,
			find_command = { "fd", "--type", "f", "--extension", filetype },
			prompt_title = "Find Template",
			preview_title = "Template Preview",
			attach_mappings = function(_, map)
				map("n", "<CR>", copy_template)
				map("i", "<CR>", copy_template)
				return true
			end,
		})
	end, {})
end

function M.setup(opts)
	if opts == nil or opts.path == nil then
		log.warn("User path for templates are not specified in config. Therefore, the plugin setup is skipped.")
		return
	end

	if type(opts.path) ~= "string" then
		log.warn("Only string paths are supported in config. Therefore, the plugin setup is skipped")
	end

	setTemplatePath(opts.path)
	setUserCommand()
end

return M
