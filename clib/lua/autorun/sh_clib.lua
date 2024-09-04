CLib = CLib or {}
CLib.Version = "0.0.0"
_G.CLib = CLib

function CLib.LoadServerScript(script)
    if CLIENT then return end
    return include(script)
end

function CLib.LoadClientScript(script)
    if SERVER then
        AddCSLuaFile(script)
        return
    end
    return include(script)
end

function CLib.LoadSharedScript(script)
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
    CLib.LoadSharedScript("clib/logging/debug.lua")
    CLib.LoadSharedScript("clib/logging/error.lua")
    CLib.LoadSharedScript("clib/logging/normal.lua")
    CLib.LoadSharedScript("clib/logging/debug.lua")

    print("[CLib] Setting up CLib.Strings")
    CLib.Strings = CLib.Strings or {}
    CLib.LoadSharedScript("clib/strings/parsecolored.lua")

    print("[CLib] Setting up CLib.Chat")
    CLib.Chat = CLib.Chat or {}
    CLib.LoadSharedScript("clib/chat/genericmessage.lua")
    CLib.LoadServerScript("clib/chat/servermessage.lua")

    print("----------------------------------------")
end

concommand.Add("clib_reload",Load)
Load()