CLib = _G.CLib
if !CLib then return error("[CAdverts] Missing required dependency CLib!") end

CAdverts = CAdverts or {}

CAdverts.Rotation = {
    every = 10,
    adverts = {
        "[&#ff0000]Lorem [&#00ff00]ipsum [&#ffff00]dolor",
        "[&#0000ff]sit [&#ff00ff]amet, [&#00ffff]consectetur",
        "[&#000000]adipiscing",
    }
}

CAdverts.Repeating = {
    {
        name = "Example",
        every = 20,
        content = "[&#ff0000]FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUCK"
    },
}