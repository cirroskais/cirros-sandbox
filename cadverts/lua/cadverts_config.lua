CLib = _G.CLib
if !CLib then return error("[CAdverts] Missing required dependency CLib!") end

CAdverts = CAdverts or {}

CAdverts.Rotation = {
    every = 300,
    adverts = {
        -- "[&#ff0000]Lorem [&#00ff00]ipsum [&#0000ff]dolor[&reset].",
        -- {
        --     CLib.Strings.ParseServerChat("mrrp", Color(0, 255, 0))
        -- },
        -- {
        --     CLib.Strings.ParseServerChat("mrow", Color(0, 0, 255))
        -- }
    }
}

CAdverts.Repeating = {
    {
        name = "mreow",
        every = 100,
        content = "[&#ff00ff]Lo[&#ff0000]rem [&#00ff00]ipsum dolor.[&#0000ff]"
    },
    -- {
    --     name = "aurrr",
    --     every = 200,
    --     content = { CLib.Strings.ParseServerChat("aurrr", Color(0, 255, 255)) }
    -- },
}