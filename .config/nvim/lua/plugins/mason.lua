return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      -- zet hier je gewenste servers, maar NIET "zk"
      "lua_ls",
      -- enz.
    },
    automatic_installation = false,
  },
}
