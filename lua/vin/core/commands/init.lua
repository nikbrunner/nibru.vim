local general = require("vin.core.commands.general")
local lsp = require("vin.core.commands.lsp")
local fzf_lua = require("vin.core.commands.fzf-lua")
local telescope = require("vin.core.commands.telescope")
require("vin.core.commands.copy")
local harpoon = require("vin.core.commands.harpoon")
require("vin.core.commands.zen")
local packer = require("vin.core.commands.packer")
require("vin.core.commands.diffview")
local utils = require("vin.core.commands.utils")

local M = {
	general = general,
	fzf_lua = fzf_lua,
	telescope = telescope,
	harpoon = harpoon,
	lsp = lsp,
	packer = packer,
	utils = utils,
}

return M
