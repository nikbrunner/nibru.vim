local M = {}

---@type LazyPluginSpec
M.spec = {
    "blumaa/ohne-accidents.nvim",
    event = "UIEnter",
    keys = {
        {
            "<leader>vc",
            ":OhneAccidents<CR>",
            desc = "Time since last config change",
        },
    },
    ---@type OhneAccidentsConfig
    opts = {
        api = "notify",
        multiLine = false,
        useLastCommit = true,
    },
}

return M.spec
