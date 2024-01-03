local lib = require("vin.lib")

local function set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    opts.silent = opts.silent == nil and true or opts.silent
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Easy Start and End of Line
set("n", "H", "^", { desc = "Move to Start of Line" })
set("n", "L", "$", { desc = "Move to End of Line" })

-- Combined commands
set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

-- Delete things without polluting clipboard
set("n", "x", '"_x', { desc = "Delete" })

-- Join lines while keeping position
set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

-- better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Add undo break-points
set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", ";", ";<c-g>u")

-- save file
set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- highlights under cursor
set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- prev/next
set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- global diagnostic mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })


-- Tab Navigation
set("n", "<Tab>", vim.cmd.tabnext, { desc = "Next Tab" })
set("n", "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Tab" })
set("n", "<leader><tab><tab>", vim.cmd.tabnew, { desc = "New Tab" })
set("n", "<leader><tab>o", vim.cmd.tabonly, { desc = "Close All Other Tabs" })
set("n", "<leader><tab>q", vim.cmd.tabclose, { desc = "Close Tab" })
set("n", "<leader><tab>1", "1gt", { desc = "Go to Tab 1" })
set("n", "<leader><tab>2", "2gt", { desc = "Go to Tab 2" })
set("n", "<leader><tab>3", "3gt", { desc = "Go to Tab 3" })
set("n", "<leader><tab>4", "4gt", { desc = "Go to Tab 4" })
set("n", "<leader><tab>5", "5gt", { desc = "Go to Tab 5" })
set("n", "<leader><tab>6", "6gt", { desc = "Go to Tab 6" })
set("n", "<leader><tab>7", "7gt", { desc = "Go to Tab 7" })
set("n", "<leader><tab>8", "8gt", { desc = "Go to Tab 8" })
set("n", "<leader><tab>9", "9gt", { desc = "Go to Tab 9" })

-- Center scren when using <C-u> and <C-d>
set({ "n", "i", "c" }, "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set({ "n", "i", "c" }, "<C-d>", "<C-d>zz", { desc = "Scroll Down" })

-- Vin Group
set("n", "<leader>vp", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
set("n", "<leader>vP", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>vi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>vI", "<cmd>NullLsInfo<CR>", { desc = "NullLS Info" })
set("n", "<leader>vr", "<cmd>LspRestart<CR>", { desc = "Restart LSP Server" })

-- Copy Group
set("n", "<leader>ccf", lib.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>ccr", lib.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>ccn", lib.copy.fileName, { desc = "File Name" })

-- Log Group
set("n", "<leader>cll", lib.log.log_symbol, { desc = "Auto Log Symbol" })
set("n", "<leader>cld", lib.log.delete_logs, { desc = "Auto Log Symbol" })

-- Find component
set("n", "<leader>fc", lib.component.find_and_open_component_file, { desc = "Find component under cursor" })
set("n", "<leader>fC", lib.component.find_and_open_files, { desc = "Find component" })

-- Tmux Group
set("n", "<leader>.n", lib.tmux.start_smug_session, { desc = "New Pre-Configured Session" })
set("n", "<leader>.c", lib.tmux.start_custom_tmux_session, { desc = "Create Custom TMUX Session" })
set("n", "<leader>.s", lib.tmux.switch_tmux_session, { desc = "Switch Session" })
set("n", "<leader>.w", lib.tmux.switch_tmux_window, { desc = "Switch Windows" })
set("n", "<leader>.q", lib.tmux.kill_tmux_session, { desc = "Quit TMUX Session" })
set("n", "<leader>..", lib.tmux.switch_nvim_instance, { desc = "Switch Neovim Instance" })

-- lsp mappings
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.buf.* for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        set("n", "K", vim.lsp.buf.hover, opts)
        set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        set("n", "gd", vim.lsp.buf.definition, opts)
        set("n", "gD", vim.lsp.buf.declaration, opts)
        set("n", "gi", vim.lsp.buf.implementation, opts)
        set("n", "gy", vim.lsp.buf.type_definition, opts)
        set("n", "gr", function()
            require("fzf-lua").lsp_references({
                jump_to_single_result = true,
                winopts = {
                    height = 0.95,
                    width = 0.75,
                    preview = {
                        layout = "vertical",
                        vertical = "up:65%",
                    },
                },
            })
        end, opts)
        set("n", "gR", "<CMD>Trouble lsp_references<CR>", opts)

        set(
            { "n", "v" },
            "<leader>ca",
            "<CMD>FzfLua lsp_code_actions<CR>",
            vim.tbl_extend("force", opts, { desc = "Code Actions" })
        )

        set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))

        set("n", "<leader>cf", "<CMD>NullFormat<CR>", vim.tbl_extend("force", opts, { desc = "Format" }))

        set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
        end, opts)
    end,
})
