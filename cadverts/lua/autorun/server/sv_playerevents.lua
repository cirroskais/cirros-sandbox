if !CLib then return error("[CAdverts] Missing required dependency CLib!") end

local function getTeamColor(steamid) 
    local groupName = "user"
    local _, data = pcall(function() return ULib.ucl.getUserInfoFromID(steamid) end)
    if data and data.group then
        groupName = data.group
    end

    local color = Color(0, 0, 0)
    for i,v in pairs(team.GetAllTeams()) do 
        if team.GetName(i) == groupName then
            color = team.GetColor(i)
        end
    end

    return color
end

local function toHex(color)
    return string.format("%x%x%x", color.r, color.g, color.b)
end

gameevent.Listen("player_connect")
hook.Add("player_connect", "CLIB_PLAYER_CONNECT_ADVERT", function(data)
    if data.bot == 1 then return end
	local name = data.name
    local steamid = data.networkid
    local color = getTeamColor(steamid)

    CLib.Chat.ServerMessage("[&#".. toHex(color) .. "]" .. name .. " [&#bac2de]is connecting to the server.", { formatColor = true })
end)

gameevent.Listen("player_activate")
hook.Add("player_activate", "CLIB_PLAYER_ACTIVATE_ADVERT", function(data) 
	local id = data.userid
    local plr = Player(id)
    if (plr:IsBot()) then return end
    local name = plr:Nick()
    local steamid = plr:SteamID()
    local color = getTeamColor(steamid)

    CLib.Chat.ServerMessage("[&#".. toHex(color) .. "]" .. name .. " [&#bac2de]has fully connected.", { formatColor = true })
end)

gameevent.Listen("player_disconnect")
hook.Add( "player_disconnect", "CLIB_PLAYER_DISCONNECT_ADVERT", function( data )
    if data.bot == 1 then return end
	local name = data.name
    local steamid = data.networkid
    local reason = data.reason
    local color = getTeamColor(steamid)

    CLib.Chat.ServerMessage("[&#".. toHex(color) .. "]" .. name .. " [&#bac2de]has left the server. [&#7c7f93]("..reason..")", { formatColor = true })
end)

