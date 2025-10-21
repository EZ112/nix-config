return {
    cmd = { "lua-language-server" },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', 'lua', '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = { 
                checkThirdParty = false,
                library = vim.env.VIMRUNTIME,
            },
            completion = { 
                callSnippet = "Replace" 
            },
        },
    },
}
