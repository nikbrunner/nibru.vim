local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    lazy = false,
    enabled = false,
    keys = {
        {
            "<leader>am",
            "<CMD>Bmessagesvs<CR>",
            desc = "[M]essages",
        },
    },
    opts = {},
}

return M.spec
