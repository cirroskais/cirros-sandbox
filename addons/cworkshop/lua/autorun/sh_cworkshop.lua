function Load() 
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

    LoadClientScript("cworkshop/cl_gui.lua")
    LoadClientScript("cworkshop/cl_trigger.lua")
    LoadSharedScript("cworkshop_config.lua")
end

concommand.Add("cworkshop_reload", Load)
Load()