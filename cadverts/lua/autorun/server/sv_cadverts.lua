if !CLib then return error("[CAdverts] Missing required dependency CLib!") end
include("cadverts_config.lua")
CAdvertsTimers = CAdvertsTimers or {}

for i,v in pairs(CAdvertsTimers) do
    timer.Remove(i)
    CAdvertsTimers[i] = nil
end

if #CAdverts.Repeating then
    for i,v in pairs(CAdverts.Repeating) do
        timer.Create(v.name, v.every, 0, function()
            CLib.Chat.GenericMessage(v.content, { formatColor = true })
        end)

        CAdvertsTimers[v.name] = true

        print("[CAdverts] Loaded repeating advert: " .. v.name)
    end
end

local curAdvert = 1
if #CAdverts.Rotation and #CAdverts.Rotation.adverts then
    timer.Create("rotation", CAdverts.Rotation.every, 0, function()
        if curAdvert > #CAdverts.Rotation.adverts then curAdvert = 1 end
        CLib.Chat.GenericMessage(CAdverts.Rotation.adverts[curAdvert], { formatColor = true })
        curAdvert = curAdvert + 1
    end)

    CAdvertsTimers.rotation = true

    print("[CAdverts] Loaded rotating advert")
end