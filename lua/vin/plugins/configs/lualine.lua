local present, lualine = pcall(require, "lualine")
if not present then
    return
end

local join = Vin.lib.utils.join

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local mode = {
    function()
        return " " .. Vin.icons.ui.Target .. " "
    end,
    padding = 0,
}

local date = {
    function()
        return os.date("%d.%m.%Y")
    end,
    padding = {
        left = 1,
        right = 0,
    },
}

local time = {
    function()
        return os.date("%H:%M:%S")
    end,
    padding = {
        left = 1,
        right = 1,
    },
}

local project_name = {
    function()
        local current_project_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local parent_project_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":h:t")
        return Vin.icons.documents.Folder
            .. " "
            .. parent_project_folder
            .. "/"
            .. current_project_folder
    end,
    padding = 2,
}

local last_commit_message = {
    function()
        local f = io.popen("git log --pretty=%s -1")
        local commit_message = f:read("*a")
        print("Test: lualine.lua [[commit_message]]", commit_message)
        f:close()
        return commit_message
    end,
    padding = 2,
}

local client_name_to_icon_map = {
    copilot = Vin.icons.git.Octoface,
    cssls = Vin.icons.lang.Css,
    tsserver = Vin.icons.lang.TypeScript,
    sumneko_lua = Vin.icons.lang.Lua,
    jsonls = Vin.icons.lang.JSON,
    html = Vin.icons.lang.Html,
    eslint = " ",
    ["null-ls"] = " ",
}

local lsp_clients = {
    function()
        local active_clients = vim.lsp.get_active_clients()

        local lsp_client_list = {}

        for _, client in pairs(active_clients) do
            local client_name = client.name
            local client_icon = join(client_name_to_icon_map[client_name], " ") or ""

            table.insert(lsp_client_list, client_icon .. client_name)
        end

        -- if copilot is found in the lsp_client_list put it as the first elements in the lsp_client_list
        for i, client in pairs(lsp_client_list) do
            if client:find("copilot") then
                table.remove(lsp_client_list, i)
                table.insert(lsp_client_list, 1, client)
            end
        end

        return join("[", table.concat(lsp_client_list, ", "), "]")
    end,
    padding = 2,
    on_click = function()
        vim.cmd("LspInfo")
    end,
}

local branch = {
    "branch",
    padding = 2,
}

local diff = {
    "diff",
    colored = true, -- Displays a colored diff status if set to true
    diff_color = {
        -- Same color values as the general color option can be used here.
        added = "DiffAdd", -- Changes the diff's added color
        modified = "DiffChange", -- Changes the diff's modified color
        removed = "DiffDelete", -- Changes the diff's removed color you
    },
    symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
    cond = hide_in_width,
}

local filetype_icon = {
    "filetype",
    colored = true, -- Displays filetype icon in color if set to true
    icon_only = true, -- Display only an icon for filetype
    padding = 1,
}

local filename = {
    "filename",
    file_status = true, -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory

    shorting_target = 10, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
        modified = "[+]", -- Text to show when the file is modified.
        readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "[New]", -- Text to show for new created file before first writting
    },
}

local tabs = {
    "tabs",
    max_length = 20, -- Maximum width of tabs component.
    mode = 0, -- 0: Shows tab_nr 1: Shows tab_name 2: Shows tab_nr + tab_name
    padding = 1,
}

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
                "nvim",
                "[NoName]",
                "alpha",
                "NvimTree",
            },
            winbar = {
                "nvim",
                "[NoName]",
                "alpha",
                "NvimTree",
            },
        },
        always_divide_middle = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    tabline = {
        lualine_a = { project_name },
        lualine_b = { branch },
        lualine_c = {},
        lualine_y = {},
        lualine_z = { tabs },
    },
    winbar = {
        lualine_b = { filetype_icon, filename },
        lualine_x = { diff, "diagnostics" },
    },
    inactive_winbar = {
        lualine_b = { filetype_icon, filename },
        lualine_y = {},
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { date, time },
        lualine_c = {},
        lualine_x = { lsp_clients, "encoding", "fileformat", "filetype" },
        lualine_y = nil,
        lualine_z = nil,
    },
    inactive_sections = {},
    extensions = {},
})