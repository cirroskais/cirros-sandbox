CLib = CLib or {}
CLib.Version = "0.0.0"
_G.CLib = CLib

local function LoadServerScript(script)
    if CLIENT then return end
    return include(script)
end

local function LoadClientScript(script)
    if SERVER then
        AddCSLuaFile(script)
        return
    end
    return include(script)
end

local function LoadSharedScript(script)
    if SERVER then AddCSLuaFile(script) end
    return include(script)
end

function Load()
    local Started = os.time()
    print("----------------------------------------")
    print("> Initializing CLib v" .. CLib.Version)
    print("> Powered by arcane snep technology...")
    print("----------------------------------------")

    print("[CLib] Setting up CLib.Logging")
    CLib.Logging = CLib.Logging or {}
    LoadSharedScript("clib/logging/debug.lua")
    LoadSharedScript("clib/logging/error.lua")
    LoadSharedScript("clib/logging/normal.lua")
    LoadSharedScript("clib/logging/debug.lua")

    print("[CLib] Setting up CLib.Strings")
    CLib.Strings = CLib.Strings or {}
    LoadSharedScript("clib/strings/parsecolored.lua")

    print("[CLib] Setting up CLib.Chat")
    CLib.Chat = CLib.Chat or {}
    LoadSharedScript("clib/chat/genericmessage.lua")
    LoadServerScript("clib/chat/servermessage.lua")
    LoadClientScript("clib/chat/disablejoinleave.lua")

    print("----------------------------------------")
end

concommand.Add("clib_reload", Load)
Load()