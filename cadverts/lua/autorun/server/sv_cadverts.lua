if !CLib then return error("[CAdverts] Missing required dependency CLib!") end
include("cadverts_config.lua")
CAdvertsTimers = CAdvertsTimers or {}

for i,v in pairs(CAdverts.Repeating) do


    CLib.Strings.ParseColored(v.content)

    -- timer.Create(v.name, v.every, 0, function()
    --     local content = v.content
    -- end)

    -- table.insert(CAdvertsTimers, v.name)
end