local M = {}

---@type LazyPluginSpec
M.spec = {
    "terra-theme/terra-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
        {
            "<leader>vtt",
            function()
                require("terra-core.lib.config").select_theme()
            end,
            desc = "Select theme",
        },
        {
            "<leader>vtv",
            function()
                require("terra-core.lib.config").select_variant()
            end,
            desc = "Select variant",
        },
    },
    ---@type TerraConfig
    opts = {
        debug = false,
        theme = "winter",
        variant = "night",
        styles = {
            dark_sidebars = true,
            transparency = "partial",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
