function Load() 
    print("Cworkshop")

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
    LoadServerScript("cworkshop/sv_trigger.lua")
end

concommand.Add("cworkshop_reload", Load)
Load()

concommand.Add("fatfuck", function()
    local f = vgui.Create( "DFrame" )
    f:SetPos( 100, 100 )
    f:SetSize( 500, 500 )
    f:MakePopup()
    f:SetTitle("CLAIM YOUR FREE FAT FUCK")
    
    local h = vgui.Create( "HTML", f )
    h:Dock( FILL )
    h:SetHTML([[
        <h1>CLICK HERE TO CLAIM YOUR FREE FAT FUCK</h1>
        <img src="https://snep.lol/download/ZAAqxTPjBB.gif" />
    ]])
end)