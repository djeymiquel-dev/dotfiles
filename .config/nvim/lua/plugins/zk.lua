return {
  "zk-org/zk-nvim",
  ft = "markdown", -- laadt alleen bij markdown-bestanden
  config = function()
    require("zk").setup({
      picker = "fzf_lua",
      picker_option = {
        fzf_lua = {
          -- Je kunt FZF-Lua config hier toevoegen, zoals theme
          winopts = {
            height = 0.5,
            width = 0.8,
            row = 0.3,
            col = 0.2,
          },
          previewer = "bat",
        },
      },
    })
  end,
}
