return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",

    dependencies = { "rafamadriz/friendly-snippets" },

    opts = {
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
    },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
