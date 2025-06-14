vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ bufnr = 0 })
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

vim.keymap.set("n", "<leader>mir", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader>gol", function()
    require("cellular-automaton").start_animation("game_of_life")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

local opts = { noremap = true, silent = true }

-- Window Management

vim.keymap.set("n", "<leader>ws", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Split window horizontally" }))
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split window vertically" }))vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, vim.tbl_extend("force", opts, { desc = "Add file to Harpoon" }))


-- Harpoon
vim.keymap.set("n", "<leader>A", function() require("harpoon"):list():prepend() end, vim.tbl_extend("force", opts, { desc = "Prepend file to Harpoon" }))
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, vim.tbl_extend("force", opts, { desc = "Toggle Harpoon menu" }))
vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end, vim.tbl_extend("force", opts, { desc = "Select Harpoon file 1" }))
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end, vim.tbl_extend("force", opts, { desc = "Select Harpoon file 2" }))
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end, vim.tbl_extend("force", opts, { desc = "Select Harpoon file 3" }))
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end, vim.tbl_extend("force", opts, { desc = "Select Harpoon file 4" }))
vim.keymap.set("n", "<leader><leader>1", function() require("harpoon"):list():replace_at(1) end, vim.tbl_extend("force", opts, { desc = "Replace Harpoon file 1" }))
vim.keymap.set("n", "<leader><leader>2", function() require("harpoon"):list():replace_at(2) end, vim.tbl_extend("force", opts, { desc = "Replace Harpoon file 2" }))
vim.keymap.set("n", "<leader><leader>3", function() require("harpoon"):list():replace_at(3) end, vim.tbl_extend("force", opts, { desc = "Replace Harpoon file 3" }))
vim.keymap.set("n", "<leader><leader>4", function() require("harpoon"):list():replace_at(4) end, vim.tbl_extend("force", opts, { desc = "Replace Harpoon file 4" }))


-- lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", vim.tbl_extend("force", opts, { desc = "Open LazyGit" }))

-- Run Terminal Command
vim.keymap.set("n", "<leader>t", function()
    local cmd = vim.fn.getcwd()
    vim.cmd("belowright split | terminal bash -i")
    vim.fn.timer_start(50, function()
        vim.cmd("startinsert")
    end)
    vim.notify("Running " .. cmd, vim.log.levels.INFO)
end, vim.tbl_extend("force", opts, { desc = "Run custom terminal command" }))

-- Toggle Terminal and File Buffer
vim.keymap.set("n", "<C-/>", function()
    local current_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "terminal" and win ~= current_win then
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
        end
    end
    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype ~= "terminal" and win ~= current_win then
            vim.api.nvim_set_current_win(win)
            return
        end
    end
    vim.notify("No terminal or file buffer found", vim.log.levels.WARN)
end, vim.tbl_extend("force", opts, { desc = "Toggle between terminal and file buffer" }))
