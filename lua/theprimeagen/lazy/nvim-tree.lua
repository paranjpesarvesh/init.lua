return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 30, side = "left" },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
      },
      filters = { dotfiles = false },
      git = { enable = true, ignore = false },
    })
    -- Keybindings
    vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
    vim.keymap.set("n", "<leader>mm", function()
      local api = require("nvim-tree.api")
      if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd l") -- Move to file buffer
      else
        api.tree.focus() -- Focus NvimTree
      end
    end, { desc = "Toggle focus between NvimTree and file" })
    vim.keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse NvimTree recursively" })
    vim.keymap.set("n", "<leader>na", function() require("nvim-tree.api").fs.create() end, { desc = "Create file/directory" })
    vim.keymap.set("n", "<leader>nr", function() require("nvim-tree.api").fs.rename() end, { desc = "Rename file/directory" })
    vim.keymap.set("n", "<leader>nd", function() require("nvim-tree.api").fs.remove() end, { desc = "Delete file/directory" })
    vim.keymap.set("n", "<leader>nR", function() require("nvim-tree.api").tree.reload() end, { desc = "Refresh NvimTree" })
    vim.keymap.set("n", "<leader>nH", function() require("nvim-tree.api").tree.toggle_hidden_filter() end, { desc = "Toggle dotfiles" })
    vim.keymap.set("n", "<leader>nI", function() require("nvim-tree.api").tree.toggle_gitignore_filter() end, { desc = "Toggle gitignored files" })
    -- -- Telescope integration
    -- require("telescope").load_extension("nvim_tree")
    -- vim.keymap.set("n", "<leader>pt", "<cmd>Telescope nvim_tree<CR>", { desc = "Telescope NvimTree" })
  end,
}
