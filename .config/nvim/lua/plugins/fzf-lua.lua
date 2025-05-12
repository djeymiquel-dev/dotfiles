return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Fzflua",
  config = function()
    require("fzf-lua").setup({})
    vim.keymap.set("n", "<leader>fx", ":Fzflua files<CR>", { desc = "Find Files" })
  end,
  keys = {
    {
      "<leader>ff",
      "<cmd> complete_file<CR>",
      desc = "Home Dir",
    },
    {
      "<leader>ft",
      function()
        require("fzf-lua").tmux_buffers()
      end,
      desc = "Tmux Buffers",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").live_grep({ cwd = "/home/djeymiquel/vaults/Study-Vault" })
      end,
      desc = "[F]ind [H]elp",
    },
  },
}
