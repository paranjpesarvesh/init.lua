-- In ~/.config/nvim/lua/theprimeagen/lazy/nvim-tree.lua
return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local api = require("nvim-tree.api")
            require("nvim-tree").setup({
                view = { width = 35 },
                update_focused_file = {
                    enable = true, -- Track current buffer
                    update_root = false, -- Don’t change tree root
                },
                filters = { git_ignored = false },
                git = { enable = true },
                renderer = { highlight_git = true },
                actions = { open_file = { quit_on_open = false } },
            })

            -- Keymappings
            local function on_attach(bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set("n", "<leader>na", api.fs.create, vim.tbl_extend("force", opts, { desc = "Create file/directory" }))
                vim.keymap.set("n", "<leader>nr", api.fs.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
                vim.keymap.set("n", "<leader>nd", api.fs.remove, vim.tbl_extend("force", opts, { desc = "Delete" }))
                vim.keymap.set("n", "<leader>nR", api.tree.reload, vim.tbl_extend("force", opts, { desc = "Refresh" }))
                vim.keymap.set("n", "<leader>nH", api.fs.toggle_hidden, vim.tbl_extend("force", opts, { desc = "Toggle dotfiles" }))
                vim.keymap.set("n", "<leader>nI", api.fs.toggle_git_ignored, vim.tbl_extend("force", opts, { desc = "Toggle gitignored" }))
                vim.keymap.set("n", "<leader>nc", api.tree.collapse_all, vim.tbl_extend("force", opts, { desc = "Collapse" }))
                vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts)
                vim.keymap.set("n", "+", function() api.tree.change_root_to_node(api.tree.get_node_under_cursor()) end, opts)
                vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
                vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts)
                vim.keymap.set("n", "g?", api.tree.toggle_help, opts)
            end

            api.events.subscribe(api.events.Event.FileCreated, function() vim.cmd("NvimTreeRefresh") end)
            api.events.subscribe(api.events.Event.TreeOpen, function() vim.cmd("wincmd p") end)

            vim.keymap.set("n", "<leader>pv", api.tree.toggle, { desc = "Toggle NvimTree" })
            vim.keymap.set("n", "<leader>nf", api.tree.focus, { desc = "Focus NvimTree" })
            vim.keymap.set("n", "<leader>nq", api.tree.close, { desc = "Close NvimTree" })
            vim.keymap.set("n", "<leader>nt", function()
                if vim.bo.filetype == "NvimTree" then
                    vim.cmd("wincmd p")
                else
                    api.tree.focus()
                end
            end, { desc = "Toggle NvimTree focus" })
            vim.keymap.set("n", "<leader>pf", function()
                local node = api.tree.get_node_under_cursor()
                if node and node.fs_stat then
                    local path = node.absolute_path
                    if node.type == "directory" then
                        require("telescope.builtin").find_files({ cwd = path })
                    else
                        require("telescope.builtin").find_files({ cwd = vim.fn.fnamemodify(path, ":h") })
                    end
                else
                    require("telescope.builtin").find_files()
                end
            end, { desc = "Telescope find files in NvimTree dir" })

            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    if vim.fn.argc() == 1 and vim.fn.argv()[1] == "." then
                        api.tree.open()
                    end
                end,
            })

            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    if vim.bo.filetype == "NvimTree" then
                        vim.cmd("setlocal cursorline")
                    end
                end,
            })

            -- Ensure nvim-tree updates on Harpoon file switch
            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    if vim.bo.filetype ~= "NvimTree" then
                        api.tree.find_file({ open = false, focus = false })
                    end
                end,
            })
        end,
    },
}
