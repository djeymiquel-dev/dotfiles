-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opt = vim.keymap.set

opt("i", "jj", "<Esc>", { noremap = true, silent = true })
opt("n", "<leader>fs", ":update<CR>", { noremap = true, silent = true, desc = "Save File" })
opt("n", "<leader>hd", Snacks.dashboard.open, { desc = "Open Dashboard starter" })

-- Move line Up / Down
opt("n", "<A-Down>", ":m +1<CR>", { noremap = true, silent = true })
opt("n", "<A-Up>", ":m -2<CR>", { noremap = true, silent = true })

-- Volg een link
vim.api.nvim_set_keymap("n", "gf", ":edit <cfile>.md<CR>", { noremap = true, silent = true })

-- ZK keymaps
-- Maak een nieuwe notitie aan in normal mode.
vim.keymap.set("n", "<leader>zn", function()
  vim.ui.input({ prompt = "Titel voor nieuwe notitie: " }, function(input)
    if input ~= nil and input ~= "" then
      require("zk").new({ title = input })
    end
  end)
end, { desc = "Nieuwe ZK notitie met titel" })

-- Maak een nieuwe notitie en link nan selectie in visual mode
vim.keymap.set("v", "<leader>zn", ":ZkNewFromTitleSelection<CR>", { desc = "ZK: New Note From Selection" })
-- Open Buffers
vim.keymap.set("n", "<leader>zb", ":ZkBuffer<CR>", { desc = "ZK: Buffers" })
-- Zoek notities
vim.keymap.set("n", "<leader>zf", ":ZkNotes<CR>", { desc = "ZK: Find Notes" })

-- Links
vim.keymap.set("n", "<leader>zlo", ":ZkLinks<CR>", { desc = "ZK: Outgiong Links" })
vim.keymap.set("n", "<leader>zlb", ":ZkBackLinks<CR>", { desc = "ZK: BackLinks" })
vim.keymap.set("n", "<leader>zli", ":ZkInsertLink<CR>", { desc = "ZK: Insert Link" })

-- Tags
vim.keymap.set("n", "<leader>zt", ":ZkTags<CR>", { desc = "ZK: Tags" })

vim.keymap.set("n", "<leader>zm", function()
  require("zk.commands").get("ZkNotes")({
    sort = { "modified" },
    match = { vim.fn.input("Search: ") },
  })
end, { desc = "Zk Notes by modified (search)" })

-- Custom ZK commands
local zk = require("zk")
local commands = require("zk.commands")

local function make_edit_fn(defaults, picker_options)
  return function(options)
    options = vim.tbl_extend("force", defaults, options or {})
    zk.edit(options, picker_options)
  end
end

commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))

commands.add("ZkRecentToday", make_edit_fn({ modifiedAfter = "today" }, { title = "Zk Recent Today" }))
commands.add("ZkRecentYesterday", make_edit_fn({ modifiedAfter = "yesterday" }, { title = "Zk Recent Yesterday" }))
commands.add("ZkRecentWeek", make_edit_fn({ modifiedAfter = "1 week ago" }, { title = "Zk Recent Week" }))

-- Notities die niet gerefereerd zijn aan door notities
vim.keymap.set("n", "<leader>zo", ":ZkOrphans<CR>", { desc = "ZK: Orphans" })
-- Recente notities
vim.keymap.set("n", "<leader>zry", ":ZkRecentYesterday<CR>", { desc = "ZK: Recent Yesterday" })
vim.keymap.set("n", "<leader>zrt", ":ZkRecentToday<CR>", { desc = "ZK: Recent Today" })
vim.keymap.set("n", "<leader>zrw", ":ZkRecentWeek<CR>", { desc = "ZK: Recent Week" })
