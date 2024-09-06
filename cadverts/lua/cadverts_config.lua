CLib = _G.CLib
if not CLib then return error("[CAdverts] Missing required dependency CLib!") end

CAdverts = CAdverts or {}

CAdverts.Rotation = {
    every = 300,
    adverts = {
        "[&#bac2de]Join our [&#5865f2]Discord [&#bac2df]server to suggest an addon or chat!\n[&#8caaee]https://discord.gg/vGc5DtzyRm",
        "[&#bac2de]Missing models or textures? Make sure to subscribe to the workshop collection!\n[&#8caaee]https://steamcommunity.com/sharedfiles/filedetails/?id=3307830375",
        "[&#bac2de]Tired of being killed? Run [&#a6d189]!build [&#bac2df]to enter buildmode.",
        "[&#bac2de]Done building? Run [&#e78284]!pvp [&#bac2df]to exit buildmode.",
    }
}

CAdverts.Repeating = {
    -- {
    --     name = "Example",
    --     every = 20,
    --     content = "[&#ff0000]FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUCK"
    -- },
}