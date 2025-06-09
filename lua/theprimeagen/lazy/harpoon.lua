return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- Initialize Harpoon
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      })

      -- Extend Telescope for Harpoon marks (optional)
      -- harpoon:extend(require("harpoon.extensions").builtins.command_on_nav(function()
      --   vim.cmd("Telescope harpoon marks")
      -- end))
    end,
  },
}
