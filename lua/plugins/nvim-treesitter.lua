return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "c", "cpp", "lua", "vim", "vimdoc", "bash" })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "lua", "vim", "bash" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
