if SERVER then
    CLib.Chat.GenericMessage = function (data)
        local mask = 0
        for i,v in pairs(data) do
            mask = mask + bit.lshift(IsColor(v) and 1 or 0, i - 1)
        end

        net.Start("CLIB_CHAT_MESSAGE")
            net.WriteInt(mask)
            for i,v in pairs(data) do
                if IsColor(v) then
                    net.WriteColor(v)
                else
                    net.WriteString(v)
                end
            end
        net.Broadcast()
    end
end

if CLIENT then
    net.Receive("CLIB_CHAT_MESSAGE", function()
        local mask = net.ReadInt()
        if (mask < 1) then return error("Received CLIB_CHAT_MESSAGE with invalid length") end

        local data = {}
        for i = 1, length do
            if bit.band(bit.lshift(1, i - 1), mask) then
                table.insert(data, net.ReadColor())
            else
                table.insert(data, net.ReadString())
            end
        end
        
        chat.AddText(unpack(table.Reverse(data)))
    end)
end