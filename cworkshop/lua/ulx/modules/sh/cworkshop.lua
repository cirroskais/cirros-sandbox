util.AddNetworkString("CWORKSHOP_OPEN_MENU")

function ulx.cworkshop(calling_ply) 
    net.Start("CWORKSHOP_OPEN_MENU")
        net.WriteBool(true)
    net.Send(calling_ply)
end

local cworkshop = ulx.command("Menus", "ulx cworkshop", ulx.cworkshop, "!cworkshop" )
cworkshop:help("Open CWorkshop's GUI to manage workshop content.")