return {
  "lervag/vimtex",
  lazy = false, -- load immediately (needed for filetype=tex)
  init = function()
    -- Globals (must run before plugin loads)
    vim.g.vimtex_view_method = "evince"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_mode = 0
  end,
  config = function()
    -- Optional: only if you want mappings local to plugin
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>lc", ":VimtexCompile<CR>", opts)
    map("n", "<leader>lv", ":VimtexView<CR>", opts)
    map("n", "<leader>lt", ":VimtexTocOpen<CR>", opts)
  end,
}

